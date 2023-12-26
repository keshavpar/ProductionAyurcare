
import 'package:ayurcareprod/home/blocs/cubit/doctor_list_cubit.dart';
import 'package:ayurcareprod/home/view/PatientView/widgets/doctor_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return doctorList();
  }
}

BlocBuilder<DoctorListCubit, DoctorListState> doctorList() {
  return BlocBuilder(builder: (context, state) {
    return Column(
      children: [
        if (state.doctors != null && state.doctors!.isNotEmpty)
          for (int i = 0; i < state.doctors!.length; i++)
            DoctorContainer(
              doc: state.doctors![i],
              raiting: state.doctors![i].ratings.toString(),
              fname: state.doctors![i].fname.toString(),
              img: 'assets/doctor-female2.png',
              lname: state.doctors![i].lname.toString(),
              // specialty: state.doctors[i].specialty,
            ),
      ],
    );
  });
}
