import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalidpassword }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;

    if (value.length < 6) {
      return PasswordValidationError.invalidpassword;
    }
    return null;
  }
}
