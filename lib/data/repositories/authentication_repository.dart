import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/data/models/local_user.dart';
import 'package:food_app/data/services/api_path.dart';
import 'package:food_app/data/services/data_base.dart';
import 'package:food_app/data/services/fire_store_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _fireStoreDatabase = FireStoreDataBase();

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  void get currentUser => _firebaseAuth.currentUser;

  Future<User?> signWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));
        return userCredential.user;
      } else {
        throw FirebaseAuthException(
            code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
            message: 'Missing Google Id Token');
      }
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );

    return userCredential.user;
  }

  Future<User?> createUserWithEmailAndPassword(
      LocalUser localUser, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: localUser.email,
      password: password,
    );
    if (userCredential.user == null) {
      throw FirebaseAuthException(
          code: 'SIGN_UP_FAILED', message: 'Sign up failed due to an error');
    }

    localUser.id = userCredential.user!.uid;
    await _fireStoreDatabase.setUser(localUser);

    return userCredential.user;
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
