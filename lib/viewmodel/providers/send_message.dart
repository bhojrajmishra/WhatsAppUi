import 'package:flutter/material.dart';

class SendMessage extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final List<String> messages = [];
  bool isUserMessage = true;

  void sendMessage() {
    if (controller.text.isNotEmpty) {
      messages.add(controller.text);
      controller.clear();
      isUserMessage = !isUserMessage;
      notifyListeners();
    }
  }
}
