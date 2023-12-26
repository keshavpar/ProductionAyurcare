import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {

  const User({
    this.fname,
    this.lname,
    this.email,
    this.role,
    this.active,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromMap(Map<String, dynamic> data) => User(
        fname: data['fname'] as String?,
        lname: data['lname'] as String?,
        email: data['email'] as String?,
        role: data['role'] as String?,
        active: data['active'] as bool?,
        id: data['_id'] as String?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? fname;
  final String? lname;
  final String? email;
  final String? role;
  final bool? active;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toMap() => {
        'fname': fname,
        'lname': lname,
        'email': email,
        'role': role,
        'active': active,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  User copyWith({
    String? fname,
    String? lname,
    String? email,
    String? role,
    bool? active,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      email: email ?? this.email,
      role: role ?? this.role,
      active: active ?? this.active,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      fname,
      lname,
      email,
      role,
      active,
      id,
      createdAt,
      updatedAt,
    ];
  }
}
