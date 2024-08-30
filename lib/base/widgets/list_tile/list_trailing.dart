import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';

///The ListTrailing is a StatelessWidget that is used to display the trailing widget of ListTile.
///
///The [chats] is a List of UserListModel.
class ListTrailing extends StatelessWidget {
  final List<UserListModel> chats;
  final int index;

  ///The constructor requires [chats] and [index].
  const ListTrailing({super.key, required this.chats, required this.index});
  @override
  Widget build(BuildContext context) {
    return Text(chats[index].id.toString());
  }
}
