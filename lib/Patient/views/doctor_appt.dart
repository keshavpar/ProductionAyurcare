import 'package:ayurcareprod/Patient/cubit/doctor_appointment/doctor_appointment_cubit.dart';
import 'package:ayurcareprod/Patient/views/appointment_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class DoctorAppointmentView extends StatelessWidget {
  final Doctor doc;
  const DoctorAppointmentView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => DoctorAppointmentCubit()..initialDate(),
      child: AppointmentDoctor(doc: doc),
    );
  }
}
