// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'bottom_nav_bar_bloc.dart';

class BottomNavBarDoctorState extends Equatable {
  const BottomNavBarDoctorState._({
    this.item = BottomNavigationBarDoctorItems.home,
  });

  const BottomNavBarDoctorState.medication(
      {this.item = BottomNavigationBarDoctorItems.medication});

  const BottomNavBarDoctorState.blog({
    this.item = BottomNavigationBarDoctorItems.blog,
  });

  final BottomNavigationBarDoctorItems item;

  @override
  List<Object> get props => [item];
}
