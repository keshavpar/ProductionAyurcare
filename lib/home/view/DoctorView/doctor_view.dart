import 'package:ayurcareprod/home/blocs/Doctor_bloc/bottom_nav_bar_bloc.dart';
import 'package:ayurcareprod/home/models/bottomnavbar.dart';
import 'package:ayurcareprod/home/view/DoctorView/home.dart';
import 'package:ayurcareprod/home/view/DoctorView/inventory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarDoctorBloc, BottomNavBarDoctorState>(
      builder: (context, state) {
        
        return Scaffold(
          body: state.item == BottomNavigationBarDoctorItems.medication
              ? const InventoryView()
              : const HomeDoctorView(),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.medication,
                  ),
                  label: 'Medicine Inventory'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message_outlined,
                  ),
                  label: 'Blogs'),
            ],
            onTap: (val) {
              context
                  .read<BottomNavBarDoctorBloc>()
                  .add(BottomNavBarDoctorItemChanged(value: val));
            },
          ),
        );
      },
    );
  }
}
