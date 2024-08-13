import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  final String title;
  final IconData icon;
  final Icon icon2;
  MyAppbar(
      {super.key,
      required this.title,
      required this.icon,
      required this.icon2});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 16, 83, 18),
      actions: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
          color: Colors.white,
        ),
        IconButton(
          icon: Icon(icon2.icon),
          onPressed: () {},
          color: Colors.white,
        ),
      ],
    );
  }
}
