import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError { empty, invalidpassword }

class ConfirmPassword
    extends FormzInput<String, ConfirmPasswordValidationError> {
  const ConfirmPassword.pure() : super.pure('');
  const ConfirmPassword.dirty([super.value = '']) : super.dirty();

  @override
  ConfirmPasswordValidationError? validator(String value) {
    if (value.isEmpty) return ConfirmPasswordValidationError.empty;

    if (value.length < 6) {
      return ConfirmPasswordValidationError.invalidpassword;
    }
    return null;
  }
}
