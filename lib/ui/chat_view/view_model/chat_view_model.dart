import 'package:flutter/material.dart';

/// This is chatview model class which is used to handle the chat view
///
///
class ChatViewModel extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final List<String> messages = [];
  bool isUserMessage = true;
  void sendMessage() {
    /// If the controller text is not empty then add the message to the list and clear the controller and change the isUserMessage to false
    if (controller.text.isNotEmpty) {
      //add the message to the list
      messages.add(controller.text);
      //clear the controller
      controller.clear();
      //change the isUserMessage to false
      isUserMessage = !isUserMessage;
      //notify the listeners
      notifyListeners();
    }
  }
}
