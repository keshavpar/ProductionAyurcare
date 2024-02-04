import 'package:ayurcareprod/authentication/role.dart';
import 'package:ayurcareprod/home/blocs/Doctor_bloc/bottom_nav_bar_bloc.dart';
import 'package:ayurcareprod/home/blocs/Patient_bloc/bottom_navigation_bar_patient_bloc.dart';
import 'package:ayurcareprod/home/view/DoctorView/doctor_view.dart';
import 'package:ayurcareprod/home/view/PatientView/patient_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final Role role;
  const HomePage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return role == Role.doctor
        ? BlocProvider<BottomNavBarDoctorBloc>(
            lazy: false,
            create: (context) => BottomNavBarDoctorBloc(),
            child: const DoctorView())
        : BlocProvider<BottomNavigationBarPatientBloc>(
            lazy: false,
            create: (context) => BottomNavigationBarPatientBloc(),
            child: const PatientView(),
          );
  }
}
