import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  UserListTile({super.key, required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: Icon(icon),
    );
  }
}
