import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:user_repository/user_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  String api = 'http://3.7.69.241:3000/api/v1';

  final _patientController = StreamController<UserRepository>();
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Stream<UserRepository> get patient async* {
    yield* _patientController.stream;
  }

//Login Request
  Future<void> logIn({
    required String email,
    required String password,
    required String role,
  }) async {
    final url = '$api/$role/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: json.encode({'email': email, 'password': password}),
    );
    final result = await jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final parsed = UserRepository.fromMap(result as Map<String, dynamic>?);
      _patientController.add(parsed);
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
      log(response.body);
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
      final parsed = UserRepository.fromMap(result as Map<String, dynamic>?);
      _patientController.add(parsed);
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
      log(response.body);
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
