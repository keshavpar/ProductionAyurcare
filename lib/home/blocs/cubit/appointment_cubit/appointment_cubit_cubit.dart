
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'appointment_cubit_state.dart';

class AppointmentCubitCubit extends Cubit<AppointmentCubitState> {
  AppointmentCubitCubit() : super(AppointmentCubitInitial());
}
