import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:user_repository/src/models/doc/proffesional_certificates.dart';
import 'package:user_repository/src/models/doc/timing.dart';

class Doctor extends Equatable {

  const Doctor({
    this.id,
    this.fullname,
    this.email,
    this.address,
    this.location,
    this.gender,
    this.role,
    this.arrayOfPatients,
    this.ratings,
    this.speciality,
    this.timing,
    this.createdAt,
    this.updatedAt,
    this.proffesionalCertificates,
  });

  factory Doctor.fromMap(Map<String, dynamic> data) => Doctor(
        id: data['_id'] as String?,
        fullname: data['fullname'] as String?,
        email: data['email'] as String?,
        address: data['address'] as String?,
        location: data['location'] as String?,
        gender: data['gender'] as String?,
        role: data['role'] as String?,
        arrayOfPatients: data['arrayOfPatients'] as List<dynamic>?,
        ratings: data['ratings'] as int?,
        speciality: data['speciality'] as String?,
        timing: (data['timing'] as List<dynamic>?)
            ?.map((e) => Timing.fromMap(e as Map<String, dynamic>))
            .toList(),
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        proffesionalCertificates: data['proffesionalCertificates'] == null
            ? null
            : ProffesionalCertificates.fromMap(
                data['proffesionalCertificates'] as Map<String, dynamic>,),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Doctor].
  factory Doctor.fromJson(String data) {
    return Doctor.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? id;
  final String? fullname;
  final String? email;
  final String? address;
  final String? location;
  final String? gender;
  final String? role;
  final List<dynamic>? arrayOfPatients;
  final int? ratings;
  final String? speciality;
  final List<Timing>? timing;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ProffesionalCertificates? proffesionalCertificates;

  Map<String, dynamic> toMap() => {
        '_id': id,
        'fullname': fullname,
        'email': email,
        'address': address,
        'location': location,
        'gender': gender,
        'role': role,
        'arrayOfPatients': arrayOfPatients,
        'ratings': ratings,
        'speciality': speciality,
        'timing': timing?.map((e) => e.toMap()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'proffesionalCertificates': proffesionalCertificates?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [Doctor] to a JSON string.
  String toJson() => json.encode(toMap());

  Doctor copyWith({
    String? id,
    String? fullname,
    String? email,
    String? address,
    String? location,
    String? gender,
    String? role,
    List<dynamic>? arrayOfPatients,
    int? ratings,
    String? speciality,
    List<Timing>? timing,
    DateTime? createdAt,
    DateTime? updatedAt,
    ProffesionalCertificates? proffesionalCertificates,
  }) {
    return Doctor(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      address: address ?? this.address,
      location: location ?? this.location,
      gender: gender ?? this.gender,
      role: role ?? this.role,
      arrayOfPatients: arrayOfPatients ?? this.arrayOfPatients,
      ratings: ratings ?? this.ratings,
      speciality: speciality ?? this.speciality,
      timing: timing ?? this.timing,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      proffesionalCertificates:
          proffesionalCertificates ?? this.proffesionalCertificates,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      fullname,
      email,
      address,
      location,
      gender,
      role,
      arrayOfPatients,
      ratings,
      speciality,
      timing,
      createdAt,
      updatedAt,
      proffesionalCertificates,
    ];
  }
}
