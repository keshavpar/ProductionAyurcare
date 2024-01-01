// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:user_repository/user_repository.dart';

class AppointmentDoctor extends StatelessWidget {
  final Doctor doc;

  const AppointmentDoctor({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${doc.fullname}'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [doctorRaiting(doc)]),
    );
  }
}

Widget doctorRaiting(Doctor doc) {
  return Row(
    children: [
      Text('Raiting: ${doc.ratings}'),
      const Icon(
        Icons.star,
        color: Color.fromARGB(255, 236, 179, 9),
      )
    ],
  );
}

// Widget doctorAppointmentButton(Doctor doc){
//   return
// }
