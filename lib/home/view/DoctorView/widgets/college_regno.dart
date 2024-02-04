import 'package:ayurcareprod/home/blocs/progress_bar/progress_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CollegeRegNo extends StatelessWidget {
  const CollegeRegNo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressBarBloc, ProgressBarState>(
        builder: (context, state) {
      return SizedBox(
        width: 80.screenWidth,
        child: TextField(
            onChanged: (value) {
              context
                  .read<ProgressBarBloc>()
                  .add(CollegeRegNoEvent(collegeReg: value));
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: 'College Registration Number',
              errorText: state.collegeRegNo.invalid
                  ? 'Invalid Registration Number'
                  : null,
            )),
      );
    });
  }
}