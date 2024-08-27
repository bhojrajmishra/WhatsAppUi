import 'package:flutter/material.dart';

//this is the user list tile widget which is used to display the user list in the list view
//the user view screen this has the text, icon, and onTap function as the parameters
//and returns the list tile with the text, icon, and onTap function.

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
