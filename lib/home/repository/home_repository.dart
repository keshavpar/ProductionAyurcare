// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:ayurcareprod/api/prodapi.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  String token;
  HomeRepository({
    required this.token,
  });
  final ApiAyurcare api = ApiAyurcare();

  Future<Map<String, dynamic>?> addProfessionalDetails(
      String collegeName,
      String regNo,
      String doctorId,
      String collegeRegNo,
      String registrationBoard,
      String degreeName,
      String passoutYear) async {
    final endpoint = "${api.api}/doctor/edit/$doctorId";
    var client = http.Client();
    final response = await client.patch(Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer $token'
        },
        body: json.encode({
          "proffesionalCertificates": {
            'collegeName': collegeName,
            'degreeName': degreeName,
            'regNo': regNo,
            'collegeRegNo': collegeRegNo,
            'registrationBoard': registrationBoard,
            'passoutYear': passoutYear
          }
        }));
    final result = await jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return result;
    } else {
      return result;
    }
  }

  Future<Map<String, dynamic>?> addTiming(
      String endTiming, String startTiming, String doctorId) async {
    final endpoint = "${api.api}/doctor/api/edit/$doctorId";
    var client = http.Client();
    final response = await client.patch(Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': token
        },
        body:
            json.encode({"startTiming": startTiming, "endTiming": endTiming}));
    final result = await jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return result['doctor'];
    } else {
      return result;
    }
  }
}
