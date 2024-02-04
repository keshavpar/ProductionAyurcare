import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:user_repository/src/models/doc/user.dart';

class Doc extends Equatable {

  const Doc({this.status, this.token, this.user});

  factory Doc.fromMap(Map<String, dynamic> data) => Doc(
        status: data['status'] as String?,
        token: data['token'] as String?,
        user: data['user'] == null
            ? null
            : Doctor.fromMap(data['user'] as Map<String, dynamic>),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Doc].
  factory Doc.fromJson(String data) {
    return Doc.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? status;
  final String? token;
  final Doctor? user;

  Map<String, dynamic> toMap() => {
        'status': status,
        'token': token,
        'user': user?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [Doc] to a JSON string.
  String toJson() => json.encode(toMap());

  Doc copyWith({
    String? status,
    String? token,
    Doctor? user,
  }) {
    return Doc(
      status: status ?? this.status,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, token, user];
}
