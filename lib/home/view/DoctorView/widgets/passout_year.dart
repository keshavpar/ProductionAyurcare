import 'package:ayurcareprod/home/blocs/progress_bar/progress_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PassoutYear extends StatelessWidget {
  const PassoutYear({super.key});

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
                  .add(PassoutYearEvent(passoutYear: value));
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: 'Passout Year',
              errorText:
                  state.passoutYear.invalid ? 'Invalid Passout Year' : null,
            )),
      );
    });
  }
}
