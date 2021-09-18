part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class SignInSuccess extends AuthState {}

class Error extends AuthState {
  final String error;
  Error({required this.error});
}

class OTPSentSuccessfully extends AuthState {}

class SignOut extends AuthState {}
