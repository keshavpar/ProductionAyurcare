part of 'doctor_list_cubit.dart';

class DoctorListState extends Equatable {
  final String? status;
  final List<Doctor>? doctors;
  final PageState? state;

  const DoctorListState(
      {this.status, this.doctors, this.state = PageState.initial});

  factory DoctorListState.fromMap(Map<String, dynamic>? data) =>
      DoctorListState(
        status: data?['status'] as String?,
        doctors: (data?['doctors'] as List<dynamic>?)
            ?.map((e) => Doctor.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'doctors': doctors?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DoctorListState].
  factory DoctorListState.fromJson(String data) {
    return DoctorListState.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DoctorListState] to a JSON string.
  String toJson() => json.encode(toMap());

  DoctorListState copyWith(
      {String? status, List<Doctor>? doctors, PageState? state}) {
    return DoctorListState(
        status: status ?? this.status,
        doctors: doctors ?? this.doctors,
        state: state ?? this.state);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, doctors, state];
}
