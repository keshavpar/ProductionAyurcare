import 'package:authentication_repository/authentication_repository.dart';
import 'package:ayurcareprod/authentication/role.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ayurcareprod/log_in/login.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<SignUpEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginEmailChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginVisibilityChanged>(_onPassVisibleChanged);
    on<LoginRoleChanged>(_onRoleChanges);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: username,
        status: Formz.validate([state.password, username]),
      ),
    );
  }

  void _onRoleChanges(LoginRoleChanged event, Emitter<LoginState> emit) {
    final role = event.role;
    emit(state.copyWith(role: role));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.email]),
      ),
    );
  }

  void _onPassVisibleChanged(
      LoginVisibilityChanged event, Emitter<LoginState> emit) {
    final passVisible = event.passVisible;

    emit(state.copyWith(passVisible: passVisible));
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _authenticationRepository.logIn(
            email: state.email.value,
            password: state.password.value,
            role: state.role.name);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}

// Future<void> _onForgotPassword(
//     LoginSubmitted event, Emitter<LoginState> emit) async {}
