import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProffesionalCertificates extends Equatable {

  const ProffesionalCertificates({
    this.collegeName,
    this.degreeName,
    this.regNo,
    this.collegeRegNo,
    this.registrationBoard,
    this.passoutYear,
    this.id,
  });

  factory ProffesionalCertificates.fromMap(Map<String, dynamic> data) {
    return ProffesionalCertificates(
      collegeName: data['collegeName'] as String?,
      degreeName: data['degreeName'] as String?,
      regNo: data['regNo'] as String?,
      collegeRegNo: data['collegeRegNo'] as String?,
      registrationBoard: data['registrationBoard'] as String?,
      passoutYear: data['passoutYear'] as String?,
      id: data['_id'] as String?,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as .
  factory ProffesionalCertificates.fromJson(String data) {
    return ProffesionalCertificates.fromMap(
        json.decode(data) as Map<String, dynamic>,);
  }
  final String? collegeName;
  final String? degreeName;
  final String? regNo;
  final String? collegeRegNo;
  final String? registrationBoard;
  final String? passoutYear;
  final String? id;

  Map<String, dynamic> toMap() => {
        'collegeName': collegeName,
        'degreeName': degreeName,
        'regNo': regNo,
        'collegeRegNo': collegeRegNo,
        'registrationBoard': registrationBoard,
        'passoutYear': passoutYear,
        '_id': id,
      };

  /// `dart:convert`
  ///
  /// Converts [ProffesionalCertificates] to a JSON string.
  String toJson() => json.encode(toMap());

  ProffesionalCertificates copyWith({
    String? collegeName,
    String? degreeName,
    String? regNo,
    String? collegeRegNo,
    String? registrationBoard,
    String? passoutYear,
    String? id,
  }) {
    return ProffesionalCertificates(
      collegeName: collegeName ?? this.collegeName,
      degreeName: degreeName ?? this.degreeName,
      regNo: regNo ?? this.regNo,
      collegeRegNo: collegeRegNo ?? this.collegeRegNo,
      registrationBoard: registrationBoard ?? this.registrationBoard,
      passoutYear: passoutYear ?? this.passoutYear,
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      collegeName,
      degreeName,
      regNo,
      collegeRegNo,
      registrationBoard,
      passoutYear,
      id,
    ];
  }
}
