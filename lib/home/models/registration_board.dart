import 'package:formz/formz.dart';

enum RegistrationValidationError { empty }

class RegistrationBoard extends FormzInput<String, RegistrationValidationError> {
  const  RegistrationBoard.pure() : super.pure('');
  const  RegistrationBoard.dirty([super.value = '']) : super.dirty();

  @override
  RegistrationValidationError? validator(String value) {
    if (value.isEmpty) return RegistrationValidationError.empty;

    return null;
  }
}
