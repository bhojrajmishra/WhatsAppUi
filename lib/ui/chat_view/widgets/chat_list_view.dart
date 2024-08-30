import 'package:flutter/material.dart';
import 'package:flutter_first_ui/base/list_tile_leading.dart';
import 'package:flutter_first_ui/base/list_tile_title.dart';
import 'package:flutter_first_ui/base/list_trailing.dart';
import 'package:flutter_first_ui/ui/chat_view/chat_view.dart';
import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';

class ChatListView extends StatelessWidget {
  final List<UserListModel> chats;
  final VoidCallback onRefresh;

  const ChatListView({
    required this.chats,
    required this.onRefresh,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
      },
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatView(
                      title: chats[index].email,
                    ),
                  ),
                );
              },
              leading: ListTileLeading(chats: chats, index: index),
              title: ListTileTitle(index: index, chats: chats),
              subtitle: ListTileTitle(index: index, chats: chats),
              trailing: ListTrailing(chats: chats, index: index));
        },
      ),
    );
  }
}
