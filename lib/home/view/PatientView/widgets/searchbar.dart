import 'package:ayurcareprod/authentication/bloc/authentication_bloc.dart';
import 'package:ayurcareprod/home/blocs/cubit/doctor_list/doctor_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<DoctorListCubit, DoctorListState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.all(3.screenWidth),
            padding: EdgeInsets.only(left: 1.screenWidth),
            width: 95.screenWidth,
            height: 16.screenWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60.screenWidth,
                  child: TextField(
                    onChanged: (value) {
                      context.read<DoctorListCubit>().getDoctor(
                          context.read<AuthenticationBloc>().pat!.token!,
                          value);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(thickness: 1.5),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_alt_rounded,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person_search, color: Colors.blue)),
              ],
            ),
          );
        },
      ),
    );
  }
}
