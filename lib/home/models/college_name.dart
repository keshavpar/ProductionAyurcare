import 'package:formz/formz.dart';

enum CollegeNameValidationError { empty }

class DoctorCollegeName extends FormzInput<String, CollegeNameValidationError> {
  const  DoctorCollegeName.pure() : super.pure('');
  const  DoctorCollegeName.dirty([super.value = '']) : super.dirty();

  @override
  CollegeNameValidationError? validator(String value) {
    if (value.isEmpty) return CollegeNameValidationError.empty;

    return null;
  }
}

