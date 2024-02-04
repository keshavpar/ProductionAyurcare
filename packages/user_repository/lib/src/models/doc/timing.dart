import 'dart:convert';

import 'package:equatable/equatable.dart';

class Timing extends Equatable {

  const Timing({this.startTiming, this.endTiming, this.id});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Timing].
  factory Timing.fromJson(String data) {
    return Timing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory Timing.fromMap(Map<String, dynamic> data) => Timing(
        startTiming: data['start_timing'] as String?,
        endTiming: data['end_timing'] as String?,
        id: data['_id'] as String?,
      );
  final String? startTiming;
  final String? endTiming;
  final String? id;

  Map<String, dynamic> toMap() => {
        'start_timing': startTiming,
        'end_timing': endTiming,
        '_id': id,
      };

  /// `dart:convert`
  ///
  /// Converts [Timing] to a JSON string.
  String toJson() => json.encode(toMap());

  Timing copyWith({
    String? startTiming,
    String? endTiming,
    String? id,
  }) {
    return Timing(
      startTiming: startTiming ?? this.startTiming,
      endTiming: endTiming ?? this.endTiming,
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [startTiming, endTiming, id];
}
