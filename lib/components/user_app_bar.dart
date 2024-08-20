import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const UserAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: foregroundColor ?? Colors.white),
      ),
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      actions: actions,
      leading: leading,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
