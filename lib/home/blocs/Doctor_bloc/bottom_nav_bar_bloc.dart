import 'package:ayurcareprod/home/models/bottomnavbar.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarDoctorBloc
    extends Bloc<BottomNavBarDoctorEvent, BottomNavBarDoctorState> {
  BottomNavBarDoctorBloc() : super(const BottomNavBarDoctorState._()) {
    on<BottomNavBarDoctorItemChanged>(_onBottomNavBarItemChanged);
  }

  Future<void> _onBottomNavBarItemChanged(BottomNavBarDoctorItemChanged event,
      Emitter<BottomNavBarDoctorState> emit) async {
    switch (event.value) {
      case 0:
        return emit(const BottomNavBarDoctorState.medication());
      case 1:
        return emit(const BottomNavBarDoctorState._());
      case 2:
        return emit(const BottomNavBarDoctorState.blog());
    }
  }
}
