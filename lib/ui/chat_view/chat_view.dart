import 'package:flutter/material.dart';
import 'package:flutter_first_ui/components/user_app_bar.dart';
import 'package:flutter_first_ui/ui/chat_view/view_model/chat_view_model.dart';
import 'package:flutter_first_ui/ui/chat_view/widgets/message_bubble.dart';
import 'package:flutter_first_ui/ui/chat_view/widgets/message_input_row.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  final String title;
  const ChatView({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    final sendMessageModel = context.watch<ChatViewModel>();
    return Scaffold(
      appBar: UserAppBar(
        title: title,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.secondary,
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
