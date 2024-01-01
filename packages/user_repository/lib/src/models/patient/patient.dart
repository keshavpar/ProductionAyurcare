import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:user_repository/src/models/patient/data.dart';

class UserRepository extends Equatable {
  UserRepository({this.status, this.token, this.data});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as
  /// [UserRepository].
  factory UserRepository.fromJson(String data) {
    return UserRepository.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory UserRepository.fromMap(Map<String, dynamic>? data) => UserRepository(
        status: data?['status'] as String?,
        token: data?['token'] as String?,
        data: data?['data'] == null
            ? null
            : Patient.fromMap(data?['data'] as Map<String, dynamic>),
      );
  final String? status;
  final String? token;
  final Patient? data;
  final _patientController = StreamController<UserRepository>();
  Stream<UserRepository> get patient async* {
    yield* _patientController.stream;
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'token': token,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [UserRepository] to a JSON string.
  String toJson() => json.encode(toMap());

  UserRepository copyWith({
    String? status,
    String? token,
    Patient? data,
  }) {
    return UserRepository(
      status: status ?? this.status,
      token: token ?? this.token,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, token, data];
}
