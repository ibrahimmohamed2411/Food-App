part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final Name name;
  final Email email;
  final Name location;
  final Password password;
  final bool hidePassword;
  final FormzStatus status;

  SignUpState(
      {required this.name,
      required this.email,
      required this.location,
      required this.password,
      required this.hidePassword,
      required this.status});

  SignUpState copyWith(
      {Name? name,
      Email? email,
      Name? location,
      Password? password,
      bool? hidePassword,
      FormzStatus? status}) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      location: location ?? this.location,
      password: password ?? this.password,
      hidePassword: hidePassword ?? this.hidePassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [name, email, location, password, hidePassword, status];

  @override
  String toString() {
    return 'email: $email, password: $password, showPassword: $hidePassword, status: $status';
  }
}
