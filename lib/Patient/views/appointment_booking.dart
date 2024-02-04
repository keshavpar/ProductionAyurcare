// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:ayurcareprod/Patient/cubit/doctor_appointment/doctor_appointment_cubit.dart';
import 'package:ayurcareprod/Patient/views/widgets/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:user_repository/user_repository.dart';
import 'package:ayurcareprod/home/blocs/cubit/doctor_list/doctor_list_cubit.dart';

class AppointmentDoctor extends StatelessWidget {
  final Doctor doc;

  const AppointmentDoctor({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorListCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('${doc.fullname}'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          doctorAppointmentCard(doc),
          SizedBox(
            height: 0.2.screenHeight,
          ),
          const Text(
            "Appointment Date",
            style: TextStyle(fontFamily: 'GoogleFont', fontSize: 20),
          ),
          buildCalendarDialogButton(context),
          timingSlot(doc, context)
        ]),
      ),
    );
  }
}

Widget doctorRaiting(Doctor doc) {
  int i = 0;
  return Row(
    children: [
      const Text(
        'Raiting: ',
        style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
      ),
      for (i; i < doc.ratings!; i++)
        const Icon(
          Icons.star,
          color: Color.fromARGB(255, 236, 179, 9),
        ),
      if ((doc.ratings! - i) > 0)
        const Icon(
          Icons.star_half_outlined,
          color: Color.fromARGB(255, 236, 179, 9),
        )
    ],
  );
}

Widget doctorAppointmentCard(Doctor doc) {
  return SizedBox(
    height: 30.screenHeight,
    child: Card(
      elevation: 2,
      color: Colors.blue,
      shadowColor: Colors.grey,
      child: Column(children: [
        Text(doc.speciality!,
            style: const TextStyle(fontFamily: 'Roboto', fontSize: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            doctorRaiting(doc),
            Text(doc.location!,
                style: const TextStyle(fontFamily: 'Roboto', fontSize: 20)),
          ],
        ),
        SizedBox(
            width: 80.screenWidth,
            height: 20.screenHeight,
            child: Image.asset("assets/doctor-3.png"))
      ]),
    ),
  );
}

Widget timingSlotContainer(Doctor doc) {
  return SizedBox(
      height: 30.screenHeight, width: 40.screenWidth, child: const Text(""));
}

Widget timingSlot(Doctor doc, BuildContext context) {
  log(context
      .read<DoctorAppointmentCubit>()
      .state
      .dateTime
      .first!
      .toIso8601String());
  DateTime timedurationstart = DateTime.parse(doc.timing!.first.startTiming!);
  log(timedurationstart.toString());
  DateTime timedurationend = DateTime.parse(doc.timing!.first.endTiming!);
  log(timedurationend.toString());
  return  const Text('');
}
