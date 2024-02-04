import 'package:ayurcareprod/home/blocs/cubit/doctor_list/doctor_list_cubit.dart';
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DoctorContainer(
                doc: state.doctors![i],
                raiting: state.doctors![i].ratings.toString(),
                firstName: state.doctors![i].fullname.toString(),
                img: 'assets/doctor-female2.png',
                specialty: state.doctors![i].speciality.toString(),
                address: state.doctors![i].address.toString(),
              ),
            ),
      ],
    );
  });
}
