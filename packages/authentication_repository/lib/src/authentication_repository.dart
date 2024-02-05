import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:authentication_repository/src/data_stream.dart';
import 'package:authentication_repository/src/service.dart';
import 'package:http/http.dart' as http;
import 'package:user_repository/user_repository.dart';

enum AuthenticationStatus {
  unknown,
  authenticateduser,
  authenticatedDoc,
  unauthenticated
}

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  String api = 'http://3.7.69.241:3000/api/v1';
  final _patientController = StreamController<UserRepository>();
  final _docController = StreamController<Doc>();
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Stream<UserRepository> get patient async* {
    yield* _patientController.stream;
  }

  Stream<Doc> get doc async* {
    yield* _docController.stream;
  }

//Login Request
  Future<void> logIn({
    required String email,
    required String password,
    required String role,
  }) async {
    final url = '$api/$role/login';

    switch (role) {
      //For Patient Login
      case 'patient':
        final userStream = getIt<UserStream>();
        userStream.patientUserStream.listen((event) {
          log('$event Auth waale ram hai ');
        });
        final response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: json.encode({'email': email, 'password': password}),
        );
        final result = await jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          final parsed =
              UserRepository.fromMap(result as Map<String, dynamic>?);
          userStream.addPatientData(parsed);
          return _controller.add(AuthenticationStatus.authenticateduser);
        } else {
          log(response.body);
          return _controller.add(AuthenticationStatus.unauthenticated);
        }
      //For Doctor Login
      case 'doctor':
        final userStream = getIt<UserStream>();
        userStream.docUserStream.listen((event) {
          log('$event Auth waale ram hai ');
        });
        final response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: json.encode({'email': email, 'password': password}),
        );
        final result = await jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          final parsed = Doc.fromMap(result as Map<String, dynamic>);
          userStream.addDoctorData(parsed);
          return _controller.add(AuthenticationStatus.authenticatedDoc);
        } else {
          log(response.body);
          return _controller.add(AuthenticationStatus.unauthenticated);
        }
    }
  }

  //Signup Request
  Future<void> signUp({
    required String email,
    required String password,
    required String fname,
    required String lname,
    required String confirmpassword,
    required String role,
  }) async {
    final url = '$api/$role/signup';

    switch (role) {
      case 'doctor':
        final response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: json.encode({
            'lname': lname,
            'fname': fname,
            'email': email,
            'password': password,
            'passwordConfirm': confirmpassword,
            'role': role,
          }),
        );
        final result = await jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          final parsed = Doc.fromMap(result as Map<String, dynamic>);
          _docController.add(parsed);
          getIt<UserStream>.call().addDoctorData(parsed);
          return _controller.add(AuthenticationStatus.authenticatedDoc);
        } else {
          log(response.body);
          return _controller.add(AuthenticationStatus.unauthenticated);
        }

      case 'patient':
        final response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: json.encode({
            'lname': lname,
            'fname': fname,
            'email': email,
            'password': password,
            'passwordConfirm': confirmpassword,
            'role': role,
          }),
        );
        final result = await jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          final parsed =
              UserRepository.fromMap(result as Map<String, dynamic>?);
          getIt<UserStream>.call().addPatientData(parsed);
          return _controller.add(AuthenticationStatus.authenticateduser);
        } else {
          log(response.body);
          return _controller.add(AuthenticationStatus.unauthenticated);
        }
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
