import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  const UserListTile({
    Key? key,
    required this.text,
    required this.icon,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(text),
      leading: Icon(icon),
      subtitle: Text(text),
      trailing: Text(text),
    );
  }
}
