import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'today_appointment_state.dart';

class TodayAppointmentCubit extends Cubit<TodayAppointmentState> {
  TodayAppointmentCubit() : super(TodayAppointmentInitial());
}
