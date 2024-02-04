// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'progress_bar_bloc.dart';

enum Response { basic, certification, timing, failed }

class ProgressBarState extends Equatable {
  final DoctorCollegeName collegeName;
  final RegistrationNum registartionNumber;
  final DegreeName degreeName;
  final CollegeRegNo collegeRegNo;
  final RegistrationBoard registrationBoard;
  final PassoutYear passoutYear;
  final PageState pageState;
  final Response response;
  final int pageNumber;
  final FormzStatus status;
  final String doctorToken;
  final String doctorId;

  const ProgressBarState({
    this.collegeName = const DoctorCollegeName.pure(),
    this.registartionNumber = const RegistrationNum.pure(),
    this.degreeName = const DegreeName.pure(),
    this.collegeRegNo = const CollegeRegNo.pure(),
    this.registrationBoard = const RegistrationBoard.pure(),
    this.passoutYear = const PassoutYear.pure(),
    this.pageState = PageState.initial,
    this.response = Response.basic,
    this.pageNumber = 0,
    this.status = FormzStatus.pure,
    this.doctorId="",
    this.doctorToken=""
  });

  @override
  List<Object?> get props {
    return [
      collegeName,
      registartionNumber,
      degreeName,
      collegeRegNo,
      registrationBoard,
      passoutYear,
      pageState,
      response,
      pageNumber,
      status,
      doctorId,
      doctorToken
    ];
  }

  @override
  bool get stringify => true;

  ProgressBarState copyWith({
    DoctorCollegeName? collegeName,
    RegistrationNum? registartionNumber,
    DegreeName? degreeName,
    CollegeRegNo? collegeRegName,
    RegistrationBoard? registrationBoard,
    PassoutYear? passoutYear,
    PageState? pageState,
    Response? response,
    int? pageNumber,
    FormzStatus? status,
    String? doctorToken,
    String? doctorId
  }) {
    return ProgressBarState(
      collegeName: collegeName ?? this.collegeName,
      registartionNumber: registartionNumber ?? this.registartionNumber,
      degreeName: degreeName ?? this.degreeName,
      collegeRegNo: collegeRegName ?? collegeRegNo,
      registrationBoard: registrationBoard ?? this.registrationBoard,
      passoutYear: passoutYear ?? this.passoutYear,
      pageState: pageState ?? this.pageState,
      response: response ?? this.response,
      pageNumber: pageNumber ?? this.pageNumber,
      status: status ?? this.status,
      doctorId: doctorId ?? this.doctorId,
      doctorToken: doctorToken?? this.doctorToken
    );
  }
}
