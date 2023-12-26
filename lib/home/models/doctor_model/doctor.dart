import 'dart:convert';

import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
  final int? ratings;
  final String? id;
  final String? fname;
  final String? lname;
  final String? email;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? arrayOfPatients;

  const Doctor({
    this.ratings,
    this.id,
    this.fname,
    this.lname,
    this.email,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.arrayOfPatients,
  });

  factory Doctor.fromMap(Map<String, dynamic> data) => Doctor(
        ratings: data['ratings'] as int?,
        id: data['_id'] as String?,
        fname: data['fname'] as String?,
        lname: data['lname'] as String?,
        email: data['email'] as String?,
        role: data['role'] as String?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        arrayOfPatients: data['arrayOfPatients'] as List<dynamic>,
      );

  Map<String, dynamic> toMap() => {
        'ratings': ratings,
        '_id': id,
        'fname': fname,
        'lname': lname,
        'email': email,
        'role': role,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'arrayOfPatients': arrayOfPatients,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Doctor].
  factory Doctor.fromJson(String data) {
    return Doctor.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Doctor] to a JSON string.
  String toJson() => json.encode(toMap());

  Doctor copyWith({
    int? ratings,
    String? id,
    String? fname,
    String? lname,
    String? email,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<dynamic>? arrayOfPatients,
  }) {
    return Doctor(
      ratings: ratings ?? this.ratings,
      id: id ?? this.id,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      email: email ?? this.email,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      arrayOfPatients: arrayOfPatients ?? this.arrayOfPatients,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      ratings,
      id,
      fname,
      lname,
      email,
      role,
      createdAt,
      updatedAt,
      arrayOfPatients,
    ];
  }
}
