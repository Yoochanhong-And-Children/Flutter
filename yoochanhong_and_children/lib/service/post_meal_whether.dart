import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yoochanhong_and_children/model/meal_whether.dart';
import 'package:yoochanhong_and_children/secret.dart';

Future<MealWhether> mealWhether(String meal_type) async {
  Map<String, String> data = {
    "meal_type" : meal_type
  };
  final response =
  await http.post(Uri.parse("$baseUrl/whether"),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode(data));
  if (response.statusCode == 200) {
    return MealWhether.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception(response.body);
  }
}
