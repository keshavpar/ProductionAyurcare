// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ayurcareprod/home/models/doctor_model/doctor.dart';

class AppointmentDoctor extends StatelessWidget {
  final Doctor doc;
  
  const AppointmentDoctor({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${doc.fname!} ${doc.lname}'),
     ),
     body: Column(children: [
        

     ]),
      );
  }
}
