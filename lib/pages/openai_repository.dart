import 'api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OpenAiRepository {
  static var client = http.Client();

  static Future<Map<String, dynamic>> sendMessage({required prompt}) async {
    try {
      var headers = {
        'Authorization': 'Bearer $aiToken',
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('${endpoint}completions'));
      request.body = json.encode({
        "model": "text-ada-001",
        "prompt": prompt,
        "temperature": 1,
        "max_tokens": 2000
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        print('Response Body: $data');
        return json.decode(data);
      } else {
        print('Error Status Code: ${response.statusCode}');
        return {
          "status": false,
          "message": "Oops, there was an error",
        };
      }
    } catch (error) {
      print('Exception: $error');
      return {
        "status": false,
        "message": "Oops, there was an error",
      };
    }
  }
}