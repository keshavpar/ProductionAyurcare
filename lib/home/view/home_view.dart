import 'package:ayurcareprod/authentication/role.dart';

import 'package:ayurcareprod/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ayurcareprod/authentication/authentication.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeView());
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<AuthenticationBloc>().doctortoken == null) {
      return const HomePage(role: Role.patient);
    } else {
      return const HomePage(role: Role.doctor);
    }
  }
}
