import 'package:authentication_repository/authentication_repository.dart';
import 'package:ayurcareprod/authentication/role.dart';

import 'package:ayurcareprod/sign_up/bloc/sign_up_bloc.dart';
import 'package:ayurcareprod/sign_up/views/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  final Role role;
  const SignUpPage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => SignUpBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context)),
          child: SignUpForm(role: role),
        ),
      )),
    );
  }
}
