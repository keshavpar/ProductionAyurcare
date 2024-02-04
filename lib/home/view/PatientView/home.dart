import 'package:ayurcareprod/authentication/bloc/authentication_bloc.dart';
import 'package:ayurcareprod/home/blocs/cubit/doctor_list/doctor_list_cubit.dart';
import 'package:ayurcareprod/home/view/PatientView/widgets/doctor_carousel.dart';

import 'package:ayurcareprod/home/view/PatientView/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorListCubit()
        ..getDoctor(context.read<AuthenticationBloc>().pat!.token!, ""),
      child: Column(
        children: [
          Container(width: 20.screenWidth),
          const CustomSearchBar(),
          const DoctorPage(),
        ],
      ),
    );
  }
}
