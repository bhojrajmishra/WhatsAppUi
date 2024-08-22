import 'package:flutter/material.dart';

class MessageInputRow extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSendMessage;

  const MessageInputRow(
      {Key? key, required this.controller, required this.onSendMessage})
      : super(key: key);

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
                  icon: Icon(Icons.send),
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
              child: Icon(Icons.mic_rounded, color: Colors.white),
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
