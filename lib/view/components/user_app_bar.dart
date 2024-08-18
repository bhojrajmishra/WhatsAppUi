import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData icon2;

  UserAppBar({
    super.key,
    required this.title,
    required this.icon,
    required this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
          color: Colors.white,
        ),
        IconButton(
          icon: Icon(icon2),
          onPressed: () {},
          color: Colors.white,
        ),
      ],
    );
  }
}
