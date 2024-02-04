import 'package:formz/formz.dart';

enum CollegeRegNoValidationError { empty }

class CollegeRegNo extends FormzInput<String, CollegeRegNoValidationError> {
  const CollegeRegNo.pure() : super.pure('');
  const CollegeRegNo.dirty([super.value = '']) : super.dirty();

  @override
  CollegeRegNoValidationError? validator(String value) {
    if (value.isEmpty) return CollegeRegNoValidationError.empty;

    return null;
  }
}
