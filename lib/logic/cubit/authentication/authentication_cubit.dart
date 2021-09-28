import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/data/models/email.dart';
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
      await _authenticationRepository.logInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      emit(AuthenticationSuccess());
    } catch (_) {
      emit(AuthenticationError());
    }
  }

  Future<void> logInWithGoogle() async {
    emit(AuthenticationInProgress());
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(AuthenticationSuccess());
    } catch (_) {
      emit(AuthenticationError());
    }
  }

  Future<void> signUp() async {
    try {
      emit(AuthenticationInProgress());
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthenticationSuccess());
    } catch (_) {
      emit(AuthenticationError());
    }
  }

  Future<void> signOut() async {
    await _authenticationRepository.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _authenticationRepository.sendPasswordResetEmail(email);
  }
}
