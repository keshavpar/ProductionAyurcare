import 'package:ayurcareprod/Patient/cubit/doctor_appointment/doctor_appointment_cubit.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

String _getValueText(
  CalendarDatePicker2Type datePickerType,
  List<DateTime?> values,
) {
  values = values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
  var valueText = (values.isNotEmpty ? values[0] : null)
      .toString()
      .replaceAll('00:00:00.000', '');

  if (datePickerType == CalendarDatePicker2Type.multi) {
    valueText = values.isNotEmpty
        ? values
            .map((v) => v.toString().replaceAll('00:00:00.000', ''))
            .join(', ')
        : 'null';
  } else if (datePickerType == CalendarDatePicker2Type.range) {
    if (values.isNotEmpty) {
      final startDate = values[0].toString().replaceAll('00:00:00.000', '');
      final endDate = values.length > 1
          ? values[1].toString().replaceAll('00:00:00.000', '')
          : 'null';
      valueText = '$startDate to $endDate';
    } else {
      return 'null';
    }
  }

  return valueText;
}

buildCalendarDialogButton(BuildContext context) {
  const dayTextStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w700);
  final weekendTextStyle =
      TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
  final anniversaryTextStyle = TextStyle(
    color: Colors.red[400],
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );
  final config = CalendarDatePicker2WithActionButtonsConfig(
    dayTextStyle: dayTextStyle,
    calendarType: CalendarDatePicker2Type.single,
    selectedDayHighlightColor: Colors.purple[800],
    closeDialogOnCancelTapped: true,
    firstDayOfWeek: 1,
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    controlsTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    centerAlignModePicker: true,
    customModePickerIcon: const SizedBox(),
    selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
    dayTextStylePredicate: ({required date}) {
      TextStyle? textStyle;
      if (date.weekday == DateTime.saturday ||
          date.weekday == DateTime.sunday) {
        textStyle = weekendTextStyle;
      }
      if (DateUtils.isSameDay(date, DateTime(2021, 1, 25))) {
        textStyle = anniversaryTextStyle;
      }
      return textStyle;
    },
    dayBuilder: ({
      required date,
      textStyle,
      decoration,
      isSelected,
      isDisabled,
      isToday,
    }) {
      Widget? dayWidget;
      if (date.day % 3 == 0 && date.day % 9 != 0) {
        dayWidget = Container(
          decoration: decoration,
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const Text(''
                    // MaterialLocalizations.of(context).formatDecimal(date.day),
                    // style: textStyle,
                    ),
                Padding(
                  padding: const EdgeInsets.only(top: 27.5),
                  child: Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:
                          isSelected == true ? Colors.white : Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return dayWidget;
    },
    yearBuilder: ({
      required year,
      decoration,
      isCurrentYear,
      isDisabled,
      isSelected,
      textStyle,
    }) {
      return Center(
        child: Container(
          decoration: decoration,
          height: 36,
          width: 72,
          child: Center(
            child: Semantics(
              selected: isSelected,
              button: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    year.toString(),
                    style: textStyle,
                  ),
                  if (isCurrentYear == true)
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(left: 5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            final values = await showCalendarDatePicker2Dialog(
              context: context,
              config: config,
              dialogSize: const Size(325, 400),
              borderRadius: BorderRadius.circular(15),
              value: context.read<DoctorAppointmentCubit>().state.dateTime,
              dialogBackgroundColor: Colors.white,
            );
            if (values != null) {
              // ignore: avoid_print
              print(_getValueText(
                config.calendarType,
                values,
              ));

              context.read<DoctorAppointmentCubit>().updateDate(values);
            }
          },
          child: BlocBuilder<DoctorAppointmentCubit, DoctorAppointmentState>(
            builder: (context, state) {
              return Row(
                children: [
                  Text(
                      DateFormat('dd MM yyyy').format(context.read<DoctorAppointmentCubit>().state.dateTime.first!)),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.calendar_month)
                ],
              );
            },
          ),
        ),
      ],
    ),
  );
}
