import 'package:authentication_repository/authentication_repository.dart';

import 'package:ayurcareprod/log_in/bloc/bloc/login_bloc.dart';
import 'package:ayurcareprod/log_in/views/patient_login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context)),
          child: const LoginForm(),
        ),
      )),
    );
  }
}
