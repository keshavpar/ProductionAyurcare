// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class _AuthenticationUserStatusChanged extends AuthenticationEvent {
  const _AuthenticationUserStatusChanged({
    required this.status,
    required this.user
  });

  final AuthenticationStatus status;
  final UserRepository user;
}

class _AuthenticationDoctorStatusChanged extends AuthenticationEvent {
  const _AuthenticationDoctorStatusChanged(

    this.doctor,
  );


  final Doc? doctor;
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
