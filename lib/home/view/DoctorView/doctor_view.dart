import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.medication,
            ),
            label: 'Medicine Inventory'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.message_outlined,
            ),
            label: 'Blogs'),
      ]),
    );
  }
}
