
import 'package:ayurcareprod/home/blocs/progress_bar/progress_bar_bloc.dart';
import 'package:ayurcareprod/home/view/DoctorView/progress_bar_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePageDoctor extends StatelessWidget {
  const HomePageDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          BlocProvider(
            lazy: false,
            create: (context) => ProgressBarBloc(),
            child: _progressBar(context),
          ),
          // BlocProvider(
          //   create: (context) => TodayAppointmentCubit(),
          //   child: _doctorAppointmentApproval(context),
          // ),
        ],
      ),
    );
  }
}

Widget _progressBar(BuildContext context) {
  return BlocBuilder<ProgressBarBloc, ProgressBarState>(
      builder: (context, state) {
    List<Segment> segments;
    switch (state.response) {
      case Response.basic:
        segments = const [
          Segment(value: 45, color: Colors.blue, label: Text("Done")),
          Segment(value: 55, color: Colors.white, label: Text("Remaining"))
        ];
      case Response.certification:
        segments = const [
          Segment(value: 70, color: Colors.blue, label: Text("Done")),
          Segment(value: 30, color: Colors.white, label: Text("Remaining")),
        ];

      case Response.timing:
        segments = const [
          Segment(value: 100, color: Colors.blue, label: Text("Done")),
        ];

      case Response.failed:
        segments = const [
          Segment(value: 45, color: Colors.blue, label: Text("Done")),
          Segment(value: 55, color: Colors.white, label: Text("Remaining"))
        ];
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProgressBarPage()));
      },
      child: Container(
        width: double.infinity.screenWidth * 0.9,
        height: 10.screenHeight,
        decoration: BoxDecoration(
            border: Border.all(width: 5),
            borderRadius: BorderRadius.circular(5)),
        child: Column(children: [
          const Text('Complete your Profile'),
          BlocBuilder<ProgressBarBloc, ProgressBarState>(
            builder: (context, state) {
              return PrimerProgressBar(
                segments: segments,
              );
            },
          )
        ]),
      ),
    );
  });
}

/* Doctor APPOINTMENT Approval Card for the Doctor */
// Widget _doctorAppointmentApproval(BuildContext context) {
//   return BlocBuilder(builder: (context, state) {
//     return const SizedBox.shrink();
//     // return  AppointmentCardDoctor(user: user,);
//   });
// }
