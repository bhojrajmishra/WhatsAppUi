import 'package:flutter/material.dart';
import 'package:flutter_first_ui/components/message_bubble.dart';
import 'package:flutter_first_ui/components/message_input_row.dart';
import 'package:flutter_first_ui/providers/send_message.dart';
import 'package:provider/provider.dart'; // Assuming you have this widget

class ChatScreen extends StatelessWidget {
  final String title;

  const ChatScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final sendMessageModel = context.watch<SendMessageModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.attach_file_outlined),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: sendMessageModel.messages.length,
              itemBuilder: (context, index) {
                final message = sendMessageModel.messages[index];
                final isUserMessage = index % 2 == 0;
                return MessageBubble(
                  message: message,
                  isUserMessage: isUserMessage,
                );
              },
            ),
          ),
          MessageInputRow(
            controller: sendMessageModel.controller,
            onSendMessage: sendMessageModel.sendMessage,
          ),
        ],
      ),
    );
  }
}
