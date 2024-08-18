import 'package:flutter/material.dart';
import 'package:flutter_first_ui/view/components/user_list_tile.dart';

class UserListviewbuilder extends StatefulWidget {
  final List<String> status;
  final IconData icon;
  UserListviewbuilder({
    super.key,
    required this.status,
    required this.icon,
  });

  @override
  State<UserListviewbuilder> createState() => _UserListviewbuilderState();
}

class _UserListviewbuilderState extends State<UserListviewbuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.status.length,
      itemBuilder: (BuildContext context, index) {
        return UserListTile(
          text: widget.status[index],
          icon: widget.icon,
        );
      },
    );
  }
}
