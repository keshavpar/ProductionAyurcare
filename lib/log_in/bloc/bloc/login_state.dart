part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
    this.passVisible = true,
    this.role = Role.patient,
  });

  final FormzStatus status;
  final Email email;
  final Password password;
  final bool isValid;
  final bool passVisible;
  final Role role;
  LoginState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
    bool? isValid,
    bool? passVisible,
    Role? role,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      passVisible: passVisible ?? this.passVisible,
      role: role ?? this.role,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      email,
      password,
      isValid,
      passVisible,
      role,
    ];
  }

  @override
  bool get stringify => true;
}
