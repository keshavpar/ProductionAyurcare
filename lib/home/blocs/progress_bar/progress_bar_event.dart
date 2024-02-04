part of 'progress_bar_bloc.dart';

class ProgressBarEvent extends Equatable {
  const ProgressBarEvent();

  @override
  List<Object> get props => [];
}

class PageChange extends ProgressBarEvent {
  final int pageNumber;

  const PageChange({required this.pageNumber});
}

class PageContinue extends ProgressBarEvent {
  final BuildContext context;
  const PageContinue({required this.context});
}

class PageBack extends ProgressBarEvent {
  const PageBack();
}

class CollegeNameEvent extends ProgressBarEvent {
  final String collegeName;
  final String doctorId;
  final String doctorToken;

  const CollegeNameEvent(
      {required this.collegeName,
      required this.doctorId,
      required this.doctorToken});
}

class RegNoEvent extends ProgressBarEvent {
  final String regNo;

  const RegNoEvent({required this.regNo});
}

class CollegeRegNoEvent extends ProgressBarEvent {
  final String collegeReg;

  const CollegeRegNoEvent({required this.collegeReg});
}

class RegistartionBoardEvent extends ProgressBarEvent {
  final String regBoard;

  const RegistartionBoardEvent({required this.regBoard});
}

class DegreeNameEvent extends ProgressBarEvent {
  final String degreeName;

  const DegreeNameEvent({required this.degreeName});
}

class PassoutYearEvent extends ProgressBarEvent {
  final String passoutYear;

  const PassoutYearEvent({required this.passoutYear});
}

class ProfessionDetailsEvent extends ProgressBarEvent {
  final BuildContext context;
  final String token;
  final String doctorId;
  const ProfessionDetailsEvent(
      {required this.token, required this.doctorId, required this.context});
}
