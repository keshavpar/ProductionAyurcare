// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'doctor_appointment_cubit.dart';

List<DateTime?> _dialogCalendarPickerValue = [
  DateTime.now(),
];

class DoctorAppointmentState extends Equatable {
  final String? status;
  final Appointment? appointment;
  List<DateTime?> dateTime = _dialogCalendarPickerValue;
  final DateTime? time;
  final PageState pageState;

  DoctorAppointmentState({
    this.status,
    this.appointment,
    this.pageState = PageState.initial,
    required this.dateTime,
    this.time,
  });

  factory DoctorAppointmentState.fromMap(Map<String, dynamic> data) =>
      DoctorAppointmentState(
        status: data['status'] as String?,
        appointment: data['appointment'] == null
            ? null
            : Appointment.fromMap(data['appointment'] as Map<String, dynamic>),
        dateTime: const [],
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'appointment': appointment?.toMap(),
      };

  @override
  List<Object?> get props => [status, appointment, pageState, dateTime, time];

  @override
  bool get stringify => true;

  DoctorAppointmentState copyWith({
    String? status,
    Appointment? appointment,
    List<DateTime?>? dateTime,
    DateTime? time,
    PageState? pageState,
  }) {
    return DoctorAppointmentState(
      status: status ?? this.status,
      appointment: appointment ?? this.appointment,
      dateTime: dateTime ?? this.dateTime,
      time: time ?? this.time,
      pageState: pageState ?? this.pageState,
    );
  }
}
