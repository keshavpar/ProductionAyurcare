import 'package:formz/formz.dart';

enum RegistrationNumValidationError { empty }

class RegistrationNum
    extends FormzInput<String, RegistrationNumValidationError> {
  const RegistrationNum.pure() : super.pure('');
  const RegistrationNum.dirty([super.value = '']) : super.dirty();

  @override
  RegistrationNumValidationError? validator(String value) {
    if (value.isEmpty) return RegistrationNumValidationError.empty;

    return null;
  }
}
