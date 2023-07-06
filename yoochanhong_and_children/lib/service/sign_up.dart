import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yoochanhong_and_children/model/signup_response.dart';
import 'package:yoochanhong_and_children/secret.dart';

Future<SignupResponse> signUp(
    String name, guardianName, deviceToken, guardianPhoneNumber) async {
  final response = await http.post(Uri.parse("$baseUrl/user/signup"),
      headers: <String, String>{
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "name": name,
        "guardian_name": guardianName,
        "guardian_phone_number": guardianPhoneNumber,
        "device_token": deviceToken
      }));
  if (response.statusCode == 201) {
    debugPrint("성공");
    return SignupResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception(response.body);
  }
}
