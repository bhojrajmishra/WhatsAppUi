import 'package:flutter/material.dart';

//This is the chatviewmodel class which extends ChangeNotifier class this has the controller and messages list and a boolean isUserMessage which is used to check if the message is from user or not and a sendMessage function which adds the message to the messages list and clears the controller and toggles the isUserMessage boolean value and notifies the listeners.
class ChatViewModel extends ChangeNotifier {
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
