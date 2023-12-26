import 'package:authentication_repository/authentication_repository.dart';
import 'package:ayurcareprod/authentication/role.dart';
import 'package:ayurcareprod/sign_up/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';
part 'sign_up_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const SignUpState()) {
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpSubmitted>(_onSubmitted);
    on<SignUpVisibilityChanged>(_onPassVisibleChanged);
    on<SignUpRoleChanged>(_onRoleChanges);
    on<SignUpFirstChanged>(_onFirstNameChanged);
    on<SignUpLastChanged>(_onLastNameChanged);
    on<SignUpConfirmPasswordChanged>(_onConfirmPasswordChanged);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onFirstNameChanged(
      SignUpFirstChanged event, Emitter<SignUpState> emit) {
    final firstName = FirstName.dirty(event.fname);
    emit(state.copyWith(
        firstname: firstName,
        status: Formz.validate([
          firstName,
          state.lastname,
          state.email,
          state.password,
          state.confirmPassword,
        ])));
  }

  void _onLastNameChanged(SignUpLastChanged event, Emitter<SignUpState> emit) {
    final lastName = LastName.dirty(event.lname);
    emit(state.copyWith(
        lastname: lastName,
        status: Formz.validate([
          state.firstname,
          lastName,
          state.email,
          state.password,
          state.confirmPassword,
        ])));
  }

  void _onEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([
          state.firstname,
          state.lastname,
          state.password,
          state.confirmPassword,
          email
        ]),
      ),
    );
  }

  void _onRoleChanges(SignUpRoleChanged event, Emitter<SignUpState> emit) {
    final role = event.role;
    emit(state.copyWith(role: role));
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([
          state.firstname,
          state.lastname,
          state.email,
          password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void _onConfirmPasswordChanged(
    SignUpConfirmPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final cpassword = ConfirmPassword.dirty(event.cpassword);
    bool val = cpassword.value == state.password.value ? true : false;
    emit(
      state.copyWith(
        confirmPassword: cpassword,
        passequal: val,
        status: Formz.validate([
          state.firstname,
          state.lastname,
          state.email,
          state.password,
          cpassword,
        ]),
      ),
    );
  }

  void _onPassVisibleChanged(
      SignUpVisibilityChanged event, Emitter<SignUpState> emit) {
    final passVisible = event.passVisible;

    emit(state.copyWith(passVisible: passVisible));
  }

  Future<void> _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _authenticationRepository.signUp(
            fname: state.firstname.value,
            lname: state.lastname.value,
            email: state.email.value,
            password: state.password.value,
            confirmpassword: state.confirmPassword.value,
            role: state.role.name);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
