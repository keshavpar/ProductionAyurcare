import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository patientRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = patientRepository,
        super(const AuthenticationState.unknown()) {
    on<_AuthenticationUserStatusChanged>(_onAuthenticationUserStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);

    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(_AuthenticationUserStatusChanged(status, pat)),
    );

    _patientRepository = _authenticationRepository.patient.listen((event) {
      pat = event;
    });
    _docRepository = _authenticationRepository.doctor.listen((event) {
      doc = event;
    });
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;
  late StreamSubscription<UserRepository> _patientRepository;
  late StreamSubscription<Doctor> _docRepository;
  Doctor? doc;
  UserRepository? pat;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthenticationUserStatusChanged(
    _AuthenticationUserStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticateduser:
        final user = pat;
        return emit(
          user != null
              ? AuthenticationState.authenticatedUser(user)
              : const AuthenticationState.unauthenticated(),
        );
      case AuthenticationStatus.unknown:
        return emit(const AuthenticationState.unknown());
      case AuthenticationStatus.authenticatedDoc:
        final doctor = doc;
        return emit(
          doctor != null
              ? AuthenticationState.authenticatedDoc(doctor)
              : const AuthenticationState.unauthenticated(),
        );
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }
}
