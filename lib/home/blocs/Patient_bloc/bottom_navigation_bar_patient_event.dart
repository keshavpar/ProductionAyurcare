part of 'bottom_navigation_bar_patient_bloc.dart';

class BottomNavigationBarPatientEvent {
  const BottomNavigationBarPatientEvent();
}

class BottomNavigationBarPatientEventChanged
    extends BottomNavigationBarPatientEvent {
  final int value;

  BottomNavigationBarPatientEventChanged({
    required this.value,
  });
}
