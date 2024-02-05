import 'dart:async';
import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository userRepository;
  final userStream = getIt<UserStream>();
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;
  late StreamSubscription<UserRepository> patientStreamRepo;

  late StreamSubscription<Doc> doctorStream;
  Doctor? doc;
  UserRepository? pat;
  Doc? doctortoken;
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository patientRepository,
  })  : _authenticationRepository = authenticationRepository,
        userRepository = patientRepository,
        super(const AuthenticationState.unknown()) {
    on<_AuthenticationUserStatusChanged>(_onAuthenticationUserStatusChanged);
    // Code when the user logs out has to be added
    // on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(_AuthenticationUserStatusChanged(
          status: status, user: userRepository)),
    );
    getIt<UserStream>().docUserStream.listen((event) {
      log(event.toString());
      doctortoken = event;
    });
    userStream.patientUserStream.listen((event) {
      pat = event;
    });
  }

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
        final doctorToken = doctortoken;
  
        return emit(
          doctorToken != null
              ? AuthenticationState.authenticatedDoc(doctorToken)
              : const AuthenticationState.unauthenticated(),
        );
    }
  }
}

// void _onAuthenticationLogoutRequested(
//   AuthenticationLogoutRequested event,
//   Emitter<AuthenticationState> emit,
// ) {
//   _authenticationRepository.logOut();
// }
