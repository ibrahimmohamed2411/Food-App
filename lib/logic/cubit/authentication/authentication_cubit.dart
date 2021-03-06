import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/data/models/email.dart';
import 'package:food_app/data/models/local_user.dart';
import 'package:food_app/data/models/password.dart';
import 'package:food_app/data/repositories/authentication_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> logInWithCredentials(Email email, Password password) async {
    emit(AuthenticationInProgress());
    try {
      await _authenticationRepository.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      emit(AuthenticationSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationError(message: e.message!));
    }
  }

  Future<void> logInWithGoogle() async {
    emit(AuthenticationInProgress());
    try {
      await _authenticationRepository.signWithGoogle();
      emit(AuthenticationSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationError(message: e.message!));
    }
  }

  Future<void> createUserWithEmailAndPassword(
      {required LocalUser localUser, required String password}) async {
    emit(AuthenticationInProgress());
    try {
      await _authenticationRepository.createUserWithEmailAndPassword(
          localUser, password);

      emit(AuthenticationSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationError(message: e.message!));
    }
  }

  Future<void> signUp() async {
    try {
      emit(AuthenticationInProgress());
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthenticationSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationError(message: e.message!));
    }
  }

  Future<void> signOut() async {
    await _authenticationRepository.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _authenticationRepository.sendPasswordResetEmail(email);
      emit(AuthenticationSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationError(message: e.message!));
    }
  }
}
