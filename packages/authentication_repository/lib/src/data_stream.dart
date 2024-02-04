import 'dart:async';

import 'package:user_repository/user_repository.dart';

class UserStream {
  Doc doc = const Doc();
  UserRepository userRepository = UserRepository();

  StreamController<Doc> docUser = StreamController<Doc>.broadcast();
  Stream<Doc> get getDoctor => docUser.stream;

  StreamController<UserRepository> patientuser =
      StreamController<UserRepository>.broadcast();
  Stream<UserRepository> get getUser => patientuser.stream;
}
