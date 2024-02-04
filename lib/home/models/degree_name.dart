import 'package:formz/formz.dart';

enum DegreeNameValidationError { empty }

class DegreeName extends FormzInput<String, DegreeNameValidationError> {
  const DegreeName.pure() : super.pure('');
  const DegreeName.dirty([super.value = '']) : super.dirty();

  @override
  DegreeNameValidationError? validator(String value) {
    if (value.isEmpty) return DegreeNameValidationError.empty;

    return null;
  }
}
