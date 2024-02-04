// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

class ProffesionalCertificates extends Equatable {
  final String? collegeName;
  final String? degreeName;
  final String? regNo;
  final String? collegeRegNo;
  final String? passoutYear;
  final String? speciality;
  final Timing? timing;

  const ProffesionalCertificates(
      {this.collegeName,
      this.degreeName,
      this.regNo,
      this.collegeRegNo,
      this.passoutYear,
      this.speciality,
      this.timing});

  ProffesionalCertificates copyWith({
    String? collegeName,
    String? degreeName,
    String? regNo,
    String? collegeRegNo,
    String? passoutYear,
    String? speciality,
    Timing? timing,
  }) {
    return ProffesionalCertificates(
      collegeName: collegeName ?? this.collegeName,
      degreeName: degreeName ?? this.degreeName,
      regNo: regNo ?? this.regNo,
      collegeRegNo: collegeRegNo ?? this.collegeRegNo,
      passoutYear: passoutYear ?? this.passoutYear,
      speciality: speciality ?? this.speciality,
      timing: timing ?? this.timing,
    );
  }

  @override
  List<Object?> get props {
    return [
      collegeName,
      degreeName,
      regNo,
      collegeRegNo,
      passoutYear,
      speciality,
      timing,
    ];
  }
}
