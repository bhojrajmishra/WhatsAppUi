import 'package:flutter/material.dart';

/// A Custom MessageInputRow widget that display a row with textfield and a send button
/// This widget can be used in a chat view screen or any other screen where you need a row with a textfield and a send button
/// The [MessageInputRow] takes [controller] and [onSendMessage] as parameters and returns a row with the specified properties
/// Example:
///```dart
///MessageInputRow(
///  controller: controller,
/// onSendMessage: sendMessage,
/// )
/// ```
/// The above example creates a row with a textfield and a send button, and handles the send message event.
///
class MessageInputRow extends StatelessWidget {
  //The controller for the text field
  final TextEditingController controller;
  //The function to execute when the send button is pressed
  final VoidCallback onSendMessage;
  //Constructor for [MessageInputRow]
  const MessageInputRow({
    required this.controller,
    required this.onSendMessage,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Message",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: onSendMessage,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 16, 83, 18),
              onPressed: () {},
              shape: const CircleBorder(),
              child: const Icon(Icons.mic_rounded, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
