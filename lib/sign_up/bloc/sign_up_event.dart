// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SignUpFirstChanged extends SignUpEvent {
  const SignUpFirstChanged(this.fname);

  final String fname;

  @override
  List<Object> get props => [fname];
}

class SignUpLastChanged extends SignUpEvent {
  const SignUpLastChanged(this.lname);

  final String lname;

  @override
  List<Object> get props => [lname];
}

class SignUpRoleChanged extends SignUpEvent {
  const SignUpRoleChanged(this.role);

  final Role role;

  @override
  List<Object> get props => [role];
}

class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignUpConfirmPasswordChanged extends SignUpEvent {
  const SignUpConfirmPasswordChanged(this.cpassword);

  final String cpassword;

  @override
  List<Object> get props => [cpassword];
}

class SignUpVisibilityChanged extends SignUpEvent {
  const SignUpVisibilityChanged(this.passVisible);

  final bool passVisible;

  @override
  List<Object> get props => [passVisible];
}

class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted(
    this.role,
  );
  final Role role;

  @override
  @override
  String toString() => 'SignUpSubmitted(role: $role)';
}
