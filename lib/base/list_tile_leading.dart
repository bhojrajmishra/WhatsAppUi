import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';

class ListTileLeading extends StatelessWidget {
  final List<UserListModel> chats;
  final int index;
  const ListTileLeading({super.key, required this.chats, required this.index});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(chats[index].avatar),
    );
  }
}
