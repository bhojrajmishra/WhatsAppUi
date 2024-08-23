import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/chat_view/chat_view.dart';
import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';

class ChatListView extends StatelessWidget {
  final List<UserListModel> chats;
  final VoidCallback onRefresh;

  const ChatListView({
    Key? key,
    required this.chats,
    required this.onRefresh,
  }) : super(key: key);
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
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chats[index].avatar),
            ),
            title: Text(chats[index].email,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(chats[index].firstName,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(chats[index].id.toString()),
          );
        },
      ),
    );
  }
}
