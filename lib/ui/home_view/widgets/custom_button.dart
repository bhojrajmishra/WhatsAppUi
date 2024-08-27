import 'package:flutter/material.dart';

///this is custom button widget which is used to create a custom button
///this class returns a button widget that takes in the following parameters text, icon, onPressed.
class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;

  CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
