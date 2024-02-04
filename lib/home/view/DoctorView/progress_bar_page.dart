import 'dart:developer';

import 'package:ayurcareprod/home/blocs/progress_bar/progress_bar_bloc.dart';
import 'package:ayurcareprod/home/view/DoctorView/widgets/professional_certificate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProgressBarPage extends StatelessWidget {
  const ProgressBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Complete Your Profile "),
        ),
        body: SafeArea(
          child: BlocProvider(
            create: (context) => ProgressBarBloc(),
            child: const StepperWidget(),
          ),
        ));
  }
}

class StepperWidget extends StatelessWidget {
  const StepperWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressBarBloc, ProgressBarState>(
      builder: (context, state) {
        return SafeArea(
            child: Stepper(
                connectorColor: MaterialStateColor.resolveWith((states) {
                  if (states.contains(MaterialState.focused)) {
                    return const Color.fromARGB(255, 7, 135, 240);
                  } else {
                    return Colors.grey;
                  }
                }),
                onStepContinue: () {
                  context.read<ProgressBarBloc>().add(PageContinue(context: context));
                },
                onStepCancel: () =>
                    context.read<ProgressBarBloc>().add(const PageBack()),
                onStepTapped: (value) {
                  log(value.toString());
                  context
                      .read<ProgressBarBloc>()
                      .add(PageChange(pageNumber: value));
                },
                currentStep: state.pageNumber,
                type: StepperType.horizontal,
                steps: [
              Step(
                  title: const Text('Professional'),
                  content: professionalDetails()),
              Step(title: const Text('Timing'), content: timing()),
              Step(
                  title: const Text('Upload Your Doc'),
                  content: documentUpload())
            ]));
      },
    );
  }
}

Widget professionalDetails() {
  return Column(
    children: [
      const CollegeNameWidget(),
      SizedBox(
        height: 2.screenHeight,
      ),
      const DegreeName(),
      SizedBox(
        height: 2.screenHeight,
      ),
      const CollegeRegNo(),
      SizedBox(
        height: 2.screenHeight,
      ),
      const PassoutYear(),
      SizedBox(
        height: 2.screenHeight,
      ),
      const RegistartionNumberWidget(),
      SizedBox(
        height: 2.screenHeight,
      ),
      const RegistrationBoard(),
    ],
  );
}

Widget timing() {
  return const Column();
}

Widget documentUpload() {
  return const Column();
}
