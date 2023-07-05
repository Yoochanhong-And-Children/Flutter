import 'dart:convert';

import 'package:http/http.dart' as http;

Future<int> signUp(
    String name, guardianName, deviceToken, int guardianPhoneNumber) async {
  final response = await http.post(Uri.parse("http://172.30.45.13/"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "name": name,
        "guardian_name": guardianName,
        "guardian_phone_number": guardianPhoneNumber,
        "device_token": deviceToken
      }));
  if (response.statusCode == 200) {
    return 1;
  } else {
    throw Exception(response.body);
  }
}
