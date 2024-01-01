import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ayurcareprod/api/prodapi.dart';

class AppointmentRepository {
  String token;
  AppointmentRepository({
    required this.token,
  });
  final ApiAyurcare api = ApiAyurcare();

  Future<Map<String, dynamic>?> bookAppointment(
    String doctorId,
    DateTime dateOfAppt,
    DateTime timeOfAppt,
    String patientId,
    // String problem,
  ) async {
    final endpoint = "${api.api}/appointments/create";
    var client = http.Client();
    final resonse = await client.post(Uri.parse(endpoint), headers: {
      'Authorization': token,
      "Content-Type": "application/json; charset=utf-8",
    }, body: {
      "doctor_id": doctorId,
      "Date_of_Appt": dateOfAppt,
      "Time_of_Appt": timeOfAppt,
      "patient_id": patientId
    });
    if (resonse.statusCode == 200 || resonse.statusCode == 201) {
      return jsonDecode(resonse.body);
    } else {
      return jsonDecode(resonse.body);
    }
  }
}
