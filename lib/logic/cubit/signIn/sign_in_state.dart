part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final Email email;
  final Password password;
  final bool hidePassword;
  final FormzStatus status;

  SignInState(
      {required this.email,
      required this.password,
      required this.hidePassword,
      required this.status});

  SignInState copyWith(
      {Email? email,
      Password? password,
      bool? hidePassword,
      FormzStatus? status}) {
    return SignInState(
        email: email ?? this.email,
        password: password ?? this.password,
        hidePassword: hidePassword ?? this.hidePassword,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [email, password, hidePassword, status];

  @override
  String toString() {
    return 'email: $email, password: $password, showPassword: $hidePassword, status: $status';
  }
}
