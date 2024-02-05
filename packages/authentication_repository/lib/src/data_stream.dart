import 'dart:async';
import 'dart:developer';

import 'package:user_repository/user_repository.dart';

class UserStream {
  late StreamController<Doc> _docUserController;
  late StreamController<UserRepository> _patientUserController;

  UserStream() {
    _docUserController = StreamController<Doc>.broadcast();
    _patientUserController = StreamController<UserRepository>.broadcast();
  }

  // Method to add doctor data to the stream
  void addDoctorData(Doc data) {
    _docUserController.add(data);
  }

  // Method to add patient data to the stream
  void addPatientData(UserRepository data) {
    _patientUserController.add(data);
  }

  // Getter for accessing the doctor stream
  Stream<Doc> get docUserStream => _docUserController.stream;

  

  // Getter for accessing the patient stream
  Stream<UserRepository> get patientUserStream => _patientUserController.stream;

  // Dispose method to close the stream controllers when they're no longer needed
  void dispose() {
    _docUserController.close();
    _patientUserController.close();
  }
}
