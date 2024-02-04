part of 'bottom_nav_bar_bloc.dart';

class BottomNavBarDoctorEvent {
  const BottomNavBarDoctorEvent();
}

class BottomNavBarDoctorItemChanged extends BottomNavBarDoctorEvent {
  final int value;
  BottomNavBarDoctorItemChanged({
    required this.value,
  });
}
