// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'bottom_nav_bar_bloc.dart';

class BottomNavBarDoctorState extends Equatable {
  const BottomNavBarDoctorState._(
      {this.item = BottomNavigationBarDoctorItems.home,
      this.icon = const Icon(Icons.home)});

  const BottomNavBarDoctorState.medication()
      : this._(
            item: BottomNavigationBarDoctorItems.medication,
            icon: const Icon(Icons.medical_services_rounded));
  const BottomNavBarDoctorState.blog()
      : this._(
            item: BottomNavigationBarDoctorItems.blog,
            icon: const Icon(Icons.message_outlined));
  final BottomNavigationBarDoctorItems item;
  final Icon icon;

  @override
  List<Object> get props => [item, icon];
}
