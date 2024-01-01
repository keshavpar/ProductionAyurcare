// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:ayurcareprod/Patient/views/appointment_booking.dart';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:user_repository/user_repository.dart';

class DoctorContainer extends StatelessWidget {
  final Doctor doc;
  final String firstName;
  final String img;
  final String raiting;
  final String address;
  final String specialty;

  const DoctorContainer({
    Key? key,
    required this.firstName,
    required this.img,
    required this.raiting,
    required this.doc,
    required this.address,
    required this.specialty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("Page Shifted from the Home Page to the Appointment Booking for Doctor $firstName");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AppointmentDoctor(doc: doc)));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
        height: 14.sh,
        width: 80.sw,
        child: CustomPaint(
          painter: MyContainer(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -8.screenWidth,
                left: 0 - 80,
                bottom: 9,
                child: ClipRRect(
                  child: SizedBox(
                    child: Image.asset(
                      img,
                      width: 70.screenWidth,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 2.screenHeight,
                left: 40.screenWidth,
                child: Column(children: [
                  Text(firstName),
                  SizedBox(
                    height: 0.1.screenHeight,
                  ),
                  Text(specialty),
                  SizedBox(
                    height: 0.1.screenHeight,
                  ),
                  Text(address),
                  SizedBox(
                    height: 0.1.screenHeight,
                  ),
                  Row(
                    children: [
                      Text(raiting),
                      Icon(
                        Icons.star,
                        color: Colors.yellow[400],
                      )
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.blue;
    paint.strokeWidth = 5;
    paint.style = PaintingStyle.fill;

    // Calculate the points for the tilted line
    final Path linePath = Path()
      ..moveTo(size.width * 0.7, 0)
      ..lineTo(size.width * 0.43, size.height);

    // Draw the tilted line
    canvas.drawPath(linePath, paint);

    // Draw a rectangle to the left of the tilted line
    final Path blueRectPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.5, 0)
      ..lineTo(size.width * 0.4, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(blueRectPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
