import 'package:flutter/material.dart';
import 'package:flutter_first_ui/components/message_bubble.dart';
import 'package:flutter_first_ui/components/message_input_row.dart';

class Secondscreen extends StatefulWidget {
  final String title;

  const Secondscreen({super.key, required this.title});

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  bool _isUserMessage = true;

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
        _isUserMessage = !_isUserMessage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.title}",
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
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUserMessage = index % 2 == 0;
                return MessageBubble(
                  message: message,
                  isUserMessage: isUserMessage,
                );
              },
            ),
          ),
          MessageInputRow(controller: _controller, onSendMessage: _sendMessage)
        ],
      ),
    );
  }
}
