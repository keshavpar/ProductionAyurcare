import 'dart:convert';
import 'package:ayurcareprod/home/models/doctor_model/doctor.dart';
import 'package:ayurcareprod/home/models/pagestate.dart';
import 'package:ayurcareprod/home/repository/doctor_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doctor_list_state.dart';

class DoctorListCubit extends Cubit<DoctorListState> {
  DoctorListCubit() : super(const DoctorListState());

  void updateDoctor(DoctorListState newstate) {
    emit(newstate);
  }

  void getDoctor(String token, String? qt) async {
    var response;
    try {
      emit(state.copyWith(state: PageState.loading));
      PatientRepository patRepo = PatientRepository(token: "Bearer $token");
      response = await patRepo.getDoctors();
      if (response!.isNotEmpty) {
        response = DoctorListState.fromMap(response);
        updateDoctor(response as DoctorListState);
        if (qt != null) {
          emit(state.copyWith(
              state: PageState.success,
              doctors: state.doctors!
                  .where((element) =>
                      element.fname!.toLowerCase().contains(qt.toLowerCase()))
                  .toList()));
        }

        emit(state.copyWith(state: PageState.success));
      }
    } catch (e) {
      emit(state.copyWith(state: PageState.failure, doctors: state.doctors));
    }
  }
}
