// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

class AppointmentCardDoctor extends StatelessWidget {
  final Patient user;
  const AppointmentCardDoctor({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyContainer(),
      child: Stack(children: [
        Text('${user.user!.fname}' '${user.user!.lname}'),
        ElevatedButton(onPressed: () {}, child: const Text("Approve")),
        ElevatedButton(onPressed: () {}, child: const Text("Reject")),
      ]),
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
