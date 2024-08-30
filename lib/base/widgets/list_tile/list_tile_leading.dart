import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';

/// ListTileLeading is a StatelessWidget that is used to display the leading widget of ListTile.
///
/// The [chats] is a List of UserListModel.
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
