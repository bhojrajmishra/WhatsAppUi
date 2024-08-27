import 'package:flutter/material.dart';

//this is chatview model class which is used to handle the chat view
class ChatViewModel extends ChangeNotifier {
  final TextEditingController controller =
      TextEditingController(); //this is the controller for the text field
  final List<String> messages = []; //this is the list of messages
  bool isUserMessage = true;

  //this is sendMessage method which is used to send the message
  void sendMessage() {
    //if the controller text is not empty then add the message to the list and clear the controller and change the isUserMessage to false
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
