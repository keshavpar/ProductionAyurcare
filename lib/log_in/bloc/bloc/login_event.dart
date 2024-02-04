// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends SignUpEvent {
  const LoginEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class LoginRoleChanged extends SignUpEvent {
  const LoginRoleChanged(this.role);

  final Role role;

  @override
  List<Object> get props => [role];
}

class LoginPasswordChanged extends SignUpEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginVisibilityChanged extends SignUpEvent {
  const LoginVisibilityChanged(this.passVisible);

  final bool passVisible;

  @override
  List<Object> get props => [passVisible];
}

class LoginSubmitted extends SignUpEvent {
  const LoginSubmitted(
    this.role,
  );
  final Role role;


  @override
  String toString() => 'LoginSubmitted(role: $role)';
}
