import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:user_repository/src/models/patient/user.dart';

class Data extends Equatable {

  const Data({this.user});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
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
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    User? user,
  }) {
    return Data(
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [user];
}
