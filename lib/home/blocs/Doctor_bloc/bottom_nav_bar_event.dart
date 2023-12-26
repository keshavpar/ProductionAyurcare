part of 'bottom_nav_bar_bloc.dart';

class BottomNavBarDoctorEvent {
  const BottomNavBarDoctorEvent();
}

class _BottomNavBarDoctorItemChanged extends BottomNavBarDoctorEvent {
  const _BottomNavBarDoctorItemChanged(this.items);
  final BottomNavigationBarDoctorItems items;
}
