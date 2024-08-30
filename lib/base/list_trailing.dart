import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';

class ListTrailing extends StatelessWidget {
  final List<UserListModel> chats;
  final int index;

  const ListTrailing({super.key, required this.chats, required this.index});
  @override
  Widget build(BuildContext context) {
    return Text(chats[index].id.toString());
  }
}
