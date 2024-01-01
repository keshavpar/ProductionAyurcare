import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:user_repository/src/models/patient/user.dart';

class Patient extends Equatable {
  const Patient({this.user});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Patient].
  factory Patient.fromJson(String data) {
    return Patient.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory Patient.fromMap(Map<String, dynamic> data) => Patient(
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
      );
  final User? user;

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [Patient] to a JSON string.
  String toJson() => json.encode(toMap());

  Patient copyWith({
    User? user,
  }) {
    return Patient(
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [user];
}
