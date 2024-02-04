import 'package:formz/formz.dart';

enum PassoutValidationError { empty }

class PassoutYear extends FormzInput<String, PassoutValidationError> {
  const  PassoutYear.pure() : super.pure('');
  const  PassoutYear.dirty([super.value = '']) : super.dirty();

  @override
  PassoutValidationError? validator(String value) {
    if (value.isEmpty) return PassoutValidationError.empty;

    return null;
  }
}
