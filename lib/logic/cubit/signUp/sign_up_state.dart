part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final Email email;
  final Password password;
  final bool hidePassword;
  final FormzStatus status;

  SignUpState(
      {required this.email,
      required this.password,
      required this.hidePassword,
      required this.status});
  SignUpState copyWith(
      {Email? email,
      Password? password,
      bool? hidePassword,
      FormzStatus? status}) {
    return SignUpState(
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
