import 'package:ayurcareprod/home/models/bottomnavbar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarDoctorBloc
    extends Bloc<BottomNavBarDoctorEvent, BottomNavBarDoctorState> {
  BottomNavBarDoctorBloc() : super(const BottomNavBarDoctorState._()) {
    on<_BottomNavBarDoctorItemChanged>(_onBottomNavBarItemChanged);
  }

  Future<void> _onBottomNavBarItemChanged(_BottomNavBarDoctorItemChanged event,
      Emitter<BottomNavBarDoctorState> emit) async {
    switch (event.items) {
      case BottomNavigationBarDoctorItems.blog:
        return emit(const BottomNavBarDoctorState.blog());
      case BottomNavigationBarDoctorItems.medication:
        return emit(const BottomNavBarDoctorState.medication());
      case BottomNavigationBarDoctorItems.home:
        return emit(const BottomNavBarDoctorState._());
    }
  }
}
