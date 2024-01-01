// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'doctor_appointment_cubit.dart';

class DoctorAppointmentState extends Equatable {
  final String? status;
  final Appointment? appointment;
  final PageState pageState;

  const DoctorAppointmentState(
      {this.status, this.appointment, this.pageState = PageState.initial});

  factory DoctorAppointmentState.fromMap(Map<String, dynamic> data) =>
      DoctorAppointmentState(
        status: data['status'] as String?,
        appointment: data['appointment'] == null
            ? null
            : Appointment.fromMap(data['appointment'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'appointment': appointment?.toMap(),
      };

  @override
  List<Object?> get props => [status, appointment, pageState];

  @override
  bool get stringify => true;

  DoctorAppointmentState copyWith({
    String? status,
    Appointment? appointment,
    PageState? pageState,
  }) {
    return DoctorAppointmentState(
      status: status ?? this.status,
      appointment: appointment ?? this.appointment,
      pageState: pageState ?? this.pageState,
    );
  }
}
