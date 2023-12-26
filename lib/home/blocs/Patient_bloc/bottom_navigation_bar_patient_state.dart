part of 'bottom_navigation_bar_patient_bloc.dart';

class BottomNavigationBarPatientState extends Equatable {
  const BottomNavigationBarPatientState._({
    this.item = BottomNavigationBarPatientItems.home,
  });
  const BottomNavigationBarPatientState.blog({
    this.item = BottomNavigationBarPatientItems.blog,
  });
  const BottomNavigationBarPatientState.doctor(
      {this.item = BottomNavigationBarPatientItems.home});
  final BottomNavigationBarPatientItems item;

  @override
  List<Object> get props => [item];
}
