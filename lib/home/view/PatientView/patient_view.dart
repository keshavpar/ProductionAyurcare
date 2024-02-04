import 'package:ayurcareprod/home/blocs/Patient_bloc/bottom_navigation_bar_patient_bloc.dart';
import 'package:ayurcareprod/home/blocs/cubit/doctor_list/doctor_list_cubit.dart';
import 'package:ayurcareprod/home/models/bottomnavbar.dart';
import 'package:ayurcareprod/home/view/PatientView/blog.dart';
import 'package:ayurcareprod/home/view/PatientView/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientView extends StatelessWidget {
  const PatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarPatientBloc,
        BottomNavigationBarPatientState>(
      builder: (context, state) {
        return Scaffold(
          body: state.item == BottomNavigationBarPatientItems.home
              ? BlocProvider(
                  create: (context) => DoctorListCubit(),
                  child: const PatientHome(),
                )
              : const PatientBlog(),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.medical_services),
                  label: 'Doctors',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined),
                  label: 'Blogs',
                ),
              ],
              onTap: (val) {
                context
                    .read<BottomNavigationBarPatientBloc>()
                    .add(BottomNavigationBarPatientEventChanged(value: val));
              }),
        );
      },
    );
  }
}
