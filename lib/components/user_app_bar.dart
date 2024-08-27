import 'package:flutter/material.dart';

///this is a custom app bar for the user to use in the app
///that will be used in the home view to create the app bar for the user to navigate through the app
///and also to display the title of the app and the actions that the user can perform in the app this class
///returns an app bar widget that takes in the following parameters   title, actions, leading, bottom, backgroundColor, foregroundColor.

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

  //this is the preferred size of the app bar widget
  //where the height of the app bar is calculated by adding the height of the toolbar
  //and the height of the bottom widget if it is not null and returning the size of the app bar.

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
