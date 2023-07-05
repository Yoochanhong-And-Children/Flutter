import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yoochanhong_and_children/model/wording_board.dart';
import 'package:yoochanhong_and_children/secret.dart';

Future<WordingBoard> getWordingBoard() async {
  final response = await http.get(Uri.parse("$baseUrl/letter"),
      headers: <String, String>{
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      });
  if (response.statusCode == 200) {
    return WordingBoard.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception(response.body);
  }
}
