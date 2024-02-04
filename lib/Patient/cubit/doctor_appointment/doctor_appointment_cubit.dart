import 'package:ayurcareprod/Patient/models/appointment/appointment.dart';
import 'package:ayurcareprod/Patient/repo/appointment_repository.dart';
import 'package:ayurcareprod/home/models/pagestate.dart';

import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctor_appointment_state.dart';

class DoctorAppointmentCubit extends Cubit<DoctorAppointmentState> {
  DoctorAppointmentCubit()
      : super(DoctorAppointmentState(dateTime: List.empty()));

  void updateAppointment(DoctorAppointmentState newstate) {
    emit(newstate);
  }

  void initialDate() {
    List<DateTime?> date = [];
    date.add(DateTime.now());

    emit(state.copyWith(dateTime: date));
  }

  updateDate(List<DateTime?> date) {
    emit(state.copyWith(dateTime: date));
  }

  void appointmentPage(
    String doctorId,
    DateTime dateofappt,
    DateTime time,
    String patientId,
    String token,
  ) {
    Object response;
    try {
      emit(state.copyWith(pageState: PageState.loading));
      AppointmentRepository repo = AppointmentRepository(token: token);
      response = repo.bookAppointment(doctorId, dateofappt, time, patientId);
      DoctorAppointmentState value =
          DoctorAppointmentState.fromMap(response as Map<String, dynamic>);
      if (value.status == "success") {
        updateAppointment(value);
        emit(state.copyWith(pageState: PageState.success));
      }
    } catch (e) {
      emit(state.copyWith(pageState: PageState.failure));
    }
  }
}
