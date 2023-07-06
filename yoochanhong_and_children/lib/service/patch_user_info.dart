import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yoochanhong_and_children/secret.dart';

Future<int> patchUserInfo(String name, String guardian_name, String guardian_phone_number, int id) async {
  Map<String, String> data = {
    "name" : name,
    "guardian_name" : guardian_name,
    "guardian_phone_number" : guardian_phone_number,
  };
  final response =
  await http.patch(Uri.parse("$baseUrl/user/$id"),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode(data));
  if (response.statusCode == 200) {
    return 1;
  } else {
    throw Exception(response.body);
  }
}
