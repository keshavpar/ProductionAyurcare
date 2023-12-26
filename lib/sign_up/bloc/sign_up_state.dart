// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.firstname = const FirstName.pure(),
    this.lastname = const LastName.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.isValid = false,
    this.passVisible = true,
    this.role = Role.patient,
    this.passequal = false,
  });

  final FormzStatus status;
  final Email email;
  final Password password;
  final FirstName firstname;
  final LastName lastname;
  final ConfirmPassword confirmPassword;
  final bool isValid;
  final bool passVisible;
  final Role role;
  final bool passequal;
  SignUpState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
    FirstName? firstname,
    LastName? lastname,
    ConfirmPassword? confirmPassword,
    bool? isValid,
    bool? passVisible,
    Role? role,
    bool? passequal,
  }) {
    return SignUpState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isValid: isValid ?? this.isValid,
      passVisible: passVisible ?? this.passVisible,
      role: role ?? this.role,
      passequal: passequal ?? this.passequal,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      email,
      password,
      firstname,
      lastname,
      confirmPassword,
      isValid,
      passVisible,
      role,
      passequal,
    ];
  }

  @override
  bool get stringify => true;
}
