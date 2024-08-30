import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';

class ListTileTitle extends StatelessWidget {
  final int index;
  final List<UserListModel> chats;
  const ListTileTitle({super.key, required this.index, required this.chats});

  @override
  Widget build(BuildContext context) {
    return Text(chats[index].email,
        style: const TextStyle(fontWeight: FontWeight.bold));
  }
}
