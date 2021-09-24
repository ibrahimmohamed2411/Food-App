import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(Loading());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      emit(Error(error: e.message.toString()));
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    emit(Loading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(OTPSentSuccessfully());
    } on FirebaseAuthException catch (e) {
      emit(Error(error: e.message.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      //emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      emit(Error(error: e.message.toString()));
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  User? getCurrentUser() {
    FirebaseAuth.instance.currentUser;
  }
}
