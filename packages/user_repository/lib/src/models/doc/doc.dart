import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'doctor.dart';

class Doc extends Equatable {

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Doc].
  factory Doc.fromJson(String data) {
    return Doc.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  const Doc({this.status, this.token, this.doct});

  factory Doc.fromMap(Map<String, dynamic> data) => Doc(
        status: data['status'] as String?,
        token: data['token'] as String?,
        doct: data['user'] == null
            ? null
            : Doctor.fromMap(data['user'] as Map<String, dynamic>),
      );
  final String? status;
  final String? token;
  final Doctor? doct;

  Map<String, dynamic> toMap() => {
        'status': status,
        'token': token,
        'user': doct?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [Doc] to a JSON string.
  String toJson() => json.encode(toMap());

  Doc copyWith({
    String? status,
    String? token,
    Doctor? doc,
  }) {
    return Doc(
      status: status ?? this.status,
      token: token ?? this.token,
      doct: doc ?? this.doct,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, token, doct];
}
