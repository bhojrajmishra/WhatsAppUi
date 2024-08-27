import 'package:flutter/material.dart';

///this class is MessageBubble which is used to show the message in the chat extends the stateless widget
///it returns the align widget which aligns the message to the right or left based on the isUserMessage
///if the isUserMessage is true then align the message to the right else align the message to the left
///if the isUserMessage is true then the color of the message is green else the color of the message is grey
///the text widget which shows the message in the chat
class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUserMessage;

  const MessageBubble(
      {Key? key, required this.message, required this.isUserMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.green : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isUserMessage ? const Radius.circular(12) : Radius.zero,
            bottomRight:
                isUserMessage ? Radius.zero : const Radius.circular(12),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUserMessage ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
