import 'package:flutter/material.dart';
import 'openai_repository.dart';

class ChatModel extends ChangeNotifier {
  String text = "";
  String get getText => text;
  void sendChat(String txt) async {
    Map<String, dynamic> response = await OpenAiRepository.sendMessage(prompt: txt);
    if (response['choices'] != null) {
      text = response['choices'][0]['text'];
    } else {
      text = "Please try again!";
    }
    print("RESULT--------" + text);
    notifyListeners();
  }
}