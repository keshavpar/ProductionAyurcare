import 'dart:developer';

import 'package:ayurcareprod/authentication/authentication.dart';
import 'package:ayurcareprod/home/models/doctor_models.dart';
import 'package:ayurcareprod/home/models/pagestate.dart';
import 'package:ayurcareprod/home/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:user_repository/user_repository.dart';

part 'progress_bar_event.dart';
part 'progress_bar_state.dart';

class ProgressBarBloc extends Bloc<ProgressBarEvent, ProgressBarState> {
  ProgressBarBloc() : super(const ProgressBarState()) {
    on<PageChange>(_pageChangeNotifier);
    on<PageContinue>(_onPageContinue);
    on<PageBack>(_onPageBack);
    on<CollegeNameEvent>(_onCollegeNameadded);
    on<RegNoEvent>(_onRegNoadded);
    on<CollegeRegNoEvent>(_onCollegeRegNoAdded);
    on<RegistartionBoardEvent>(_onRegistrationBoardAdded);
    on<DegreeNameEvent>(_onDegreeNameAdded);
    on<PassoutYearEvent>(_onPassoutYearAdded);
    on<ProfessionDetailsEvent>(_onSubmitedProfessionalDetails);
  }
  void _pageChangeNotifier(PageChange event, Emitter<ProgressBarState> emit) {
    switch (event.pageNumber) {
      case 0:
        return emit(state.copyWith(pageNumber: 0));
      case 1:
        return emit(state.copyWith(pageNumber: 1));
      case 2:
        return emit(state.copyWith(pageNumber: 2));
    }
  }

  void _onPageContinue(PageContinue event, Emitter<ProgressBarState> emit) {
    int pageNumber = state.pageNumber;
    BuildContext context = event.context;
    if (pageNumber == 0) {
      ProfessionDetailsEvent professionDetailsEvent = ProfessionDetailsEvent(
          context: context, doctorId: state.doctorId, token: state.doctorToken);
      BlocProvider.of<ProgressBarBloc>(context).add(professionDetailsEvent);
    }
    pageNumber = pageNumber == 2 ? 2 : state.pageNumber + 1;
    log(pageNumber.toString());

    return emit(state.copyWith(pageNumber: pageNumber));
  }

  void _onPageBack(PageBack event, Emitter<ProgressBarState> emit) {
    int pageNumber = state.pageNumber == 0 ? 0 : state.pageNumber - 1;
    log(pageNumber.toString());
    emit(state.copyWith(pageNumber: pageNumber));
  }

  void _onCollegeNameadded(
      CollegeNameEvent event, Emitter<ProgressBarState> emit) {
    final collegeName = DoctorCollegeName.dirty(event.collegeName);
    final String doctorId = event.doctorId;
    final String doctorToken = event.doctorToken;
    emit(
      state.copyWith(
          collegeName: collegeName,
          doctorId: doctorId,
          doctorToken: doctorToken,
          status: Formz.validate([
            collegeName,
            state.degreeName,
            state.collegeRegNo,
            state.passoutYear,
            state.registartionNumber,
            state.registrationBoard
          ])),
    );
  }

  void _onRegNoadded(RegNoEvent event, Emitter<ProgressBarState> emit) {
    final regNo = RegistrationNum.dirty(event.regNo);
    emit(state.copyWith(
      registartionNumber: regNo,
      status: Formz.validate([
        state.collegeName,
        state.degreeName,
        state.collegeRegNo,
        state.passoutYear,
        regNo,
        state.registrationBoard
      ]),
    ));
  }

  void _onCollegeRegNoAdded(
      CollegeRegNoEvent event, Emitter<ProgressBarState> emit) {
    final collegeRegNo = CollegeRegNo.dirty(event.collegeReg);
    emit(state.copyWith(
      collegeRegName: collegeRegNo,
      status: Formz.validate([
        state.collegeName,
        state.degreeName,
        collegeRegNo,
        state.passoutYear,
        state.registartionNumber,
        state.registrationBoard
      ]),
    ));
  }

  void _onRegistrationBoardAdded(
      RegistartionBoardEvent event, Emitter<ProgressBarState> emit) {
    final registationBoard = RegistrationBoard.dirty(event.regBoard);
    emit(state.copyWith(
      registrationBoard: registationBoard,
      status: Formz.validate([
        state.collegeName,
        state.degreeName,
        state.collegeRegNo,
        state.passoutYear,
        state.registartionNumber,
        registationBoard,
      ]),
    ));
  }

  void _onDegreeNameAdded(
      DegreeNameEvent event, Emitter<ProgressBarState> emit) {
    final degreeName = DegreeName.dirty(event.degreeName);
    emit(state.copyWith(
        degreeName: degreeName,
        status: Formz.validate([
          state.collegeName,
          degreeName,
          state.collegeRegNo,
          state.passoutYear,
          state.registartionNumber,
          state.registrationBoard,
        ])));
  }

  void _onPassoutYearAdded(
      PassoutYearEvent event, Emitter<ProgressBarState> emit) {
    final passoutYear = PassoutYear.dirty(event.passoutYear);
    emit(state.copyWith(
        passoutYear: passoutYear,
        status: Formz.validate([
          state.collegeName,
          state.degreeName,
          state.collegeRegNo,
          passoutYear,
          state.registartionNumber,
          state.registrationBoard
        ])));
  }

  void _onSubmitedProfessionalDetails(
      ProfessionDetailsEvent event, Emitter<ProgressBarState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      BuildContext context = event.context;
      HomeRepository homeRepository = HomeRepository(token: event.token);
      final doc = await homeRepository.addProfessionalDetails(
          state.collegeName.value,
          state.registartionNumber.value,
          event.doctorId,
          state.collegeRegNo.value,
          state.registrationBoard.value,
          state.degreeName.value,
          state.passoutYear.value);
      if (doc!['status'] == 'success') {
        Doctor parsed = Doctor.fromMap(doc['doctor']);
        context.read<AuthenticationBloc>().doc = parsed;
        log(context.read<AuthenticationBloc>().doc.toString());
      }
    } catch (_) {}
  }
}
