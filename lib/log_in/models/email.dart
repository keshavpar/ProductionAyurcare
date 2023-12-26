import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalidemail }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;

    RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    bool val = emailRegex.hasMatch(value);

    if (val == false) {
      return EmailValidationError.invalidemail;
    }
    return null;
  }
}
