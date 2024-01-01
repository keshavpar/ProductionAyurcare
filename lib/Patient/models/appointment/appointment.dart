import 'dart:convert';

import 'package:equatable/equatable.dart';

class Appointment extends Equatable {
  final String? status;
  final Appointment? appointment;

  const Appointment({this.status, this.appointment});

  factory Appointment.fromMap(Map<String, dynamic> data) => Appointment(
        status: data['status'] as String?,
        appointment: data['appointment'] == null
            ? null
            : Appointment.fromMap(data['appointment'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'appointment': appointment?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Appointment].
  factory Appointment.fromJson(String data) {
    return Appointment.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Appointment] to a JSON string.
  String toJson() => json.encode(toMap());

  Appointment copyWith({
    String? status,
    Appointment? appointment,
  }) {
    return Appointment(
      status: status ?? this.status,
      appointment: appointment ?? this.appointment,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, appointment];
}
