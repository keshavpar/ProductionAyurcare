import 'package:ayurcareprod/home/models/bottomnavbar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_bar_patient_event.dart';
part 'bottom_navigation_bar_patient_state.dart';

class BottomNavigationBarPatientBloc extends Bloc<
    BottomNavigationBarPatientEvent, BottomNavigationBarPatientState> {
  BottomNavigationBarPatientBloc()
      : super(const BottomNavigationBarPatientState._()) {
    on<BottomNavigationBarPatientEventChanged>(_onBottomNavigationPatientEvent);
  }
  Future<void> _onBottomNavigationPatientEvent(
      BottomNavigationBarPatientEventChanged event,
      Emitter<BottomNavigationBarPatientState> emit) async {
    switch (event.value) {
      case 0:
        return emit(const BottomNavigationBarPatientState.doctor());

      case 1:
        return emit(const BottomNavigationBarPatientState._());
      case 2:
        return emit(const BottomNavigationBarPatientState.blog());
    }
  }
}
