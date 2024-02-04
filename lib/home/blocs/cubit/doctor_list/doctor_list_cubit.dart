import 'dart:convert';

import 'package:ayurcareprod/home/models/pagestate.dart';
import 'package:ayurcareprod/home/repository/doctor_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'doctor_list_state.dart';

class DoctorListCubit extends Cubit<DoctorListState> {
  DoctorListCubit() : super(const DoctorListState());

  void updateDoctor(DoctorListState newstate) {
    emit(newstate);
  }

  void getDoctor(String token, String? qt) async {
    Object? response;
    try {
      emit(state.copyWith(state: PageState.loading));
      PatientRepository patRepo = PatientRepository(token: "Bearer $token");
      response = await patRepo.getDoctors();
      DoctorListState value =
          DoctorListState.fromMap(response as Map<String, dynamic>?);
      if (value.status == "success") {
        updateDoctor(value);
        if (qt != null) {
          emit(state.copyWith(
              state: PageState.success,
              doctors: state.doctors!
                  .where((element) => element.fullname!
                      .toLowerCase()
                      .contains(qt.toLowerCase()))
                  .toList()));
        }

        emit(state.copyWith(state: PageState.success));
      }
    } catch (e) {
      emit(state.copyWith(state: PageState.failure, doctors: state.doctors));
    }
  }
}
