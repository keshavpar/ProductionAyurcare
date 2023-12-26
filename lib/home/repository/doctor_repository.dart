import 'dart:convert';

import 'package:ayurcareprod/api/prodapi.dart';
import 'package:http/http.dart' as http;

class PatientRepository {
  String token;

  PatientRepository({
    required this.token,
  });
  final ApiAyurcare api = ApiAyurcare();

  Future<Map<String, dynamic>?> getDoctors() async {
    final endpoint = "${api.api}/doctor/listOfAllDoctors";
    var client = http.Client();
    final response = await client.get(Uri.parse(endpoint), headers: {
      'Authorization': token,
      "Content-Type": "application/json; charset=utf-8",
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}
