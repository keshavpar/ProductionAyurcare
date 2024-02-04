part of 'today_appointment_cubit.dart';

sealed class TodayAppointmentState extends Equatable {
  const TodayAppointmentState();

  @override
  List<Object> get props => [];
}

final class TodayAppointmentInitial extends TodayAppointmentState {}
