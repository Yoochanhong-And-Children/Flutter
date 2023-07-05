import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yoochanhong_and_children/model/gpt_response.dart';
import 'package:yoochanhong_and_children/secret.dart';

Future<GPTResponse> gptResponse(String content) async {
  Map data = {
    "model": "gpt-3.5-turbo",
    "messages": [
      {"role": "user", "content": content}
    ]
  };
  final response =
      await http.post(Uri.parse("https://api.openai.com/v1/chat/completions"),
          headers: {
            "Authorization": "Bearer $apiKey",
            "Content-Type": "application/json",
          },
          body: jsonEncode(data));
  if (response.statusCode == 200) {
    return GPTResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception(response.body);
  }
}
