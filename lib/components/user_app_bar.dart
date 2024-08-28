import 'package:flutter/material.dart';

/// A custom app bar widget that extends [StatelessWidget] and implements [PreferredSizeWidget].
///
/// This widget returns an [AppBar] with customizable properties, including [title], [actions],
/// [leading], [bottom], [backgroundColor], and [foregroundColor].
///
/// ### Example:
/// ```dart
/// UserAppBar(
///   title: 'Home',
///   actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
///   backgroundColor: Colors.blue,
///   foregroundColor: Colors.white,
/// )
/// ```
///
/// The above example creates an app bar with a title, an action button, and custom colors.
class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The primary widget displayed in the app bar's title area.
  final String title;

  /// A list of widgets to display in a row after the [title] widget.
  /// Commonly used for action buttons.
  final List<Widget>? actions;

  /// A widget to display before the [title], typically an icon or back button.
  final Widget? leading;

  /// A widget to display at the bottom of the app bar, typically a [TabBar].
  final PreferredSizeWidget? bottom;

  /// The background color of the app bar.
  final Color? backgroundColor;

  /// The color applied to the [title] and icons in the app bar.
  final Color? foregroundColor;

  /// Constructor for [UserAppBar].
  ///
  /// All parameters except [title] are optional, with sensible defaults provided.
  const UserAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  /// Builds the custom app bar widget.
  ///
  /// This method returns an [AppBar] widget with the specified properties.
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            color: foregroundColor ?? Colors.white), // Default color is white
      ),
      backgroundColor: backgroundColor ??
          Theme.of(context)
              .colorScheme
              .primary, // Uses primary color if not provided
      actions: actions, // Optional action widgets
      leading: leading, // Optional leading widget
      bottom: bottom, // Optional bottom widget
    );
  }

  /// The preferred size of the app bar widget.
  ///
  /// This value is calculated as the height of the toolbar ([kToolbarHeight])
  /// plus the height of the [bottom] widget if it is not null.
  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
