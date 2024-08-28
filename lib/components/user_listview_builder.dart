import 'package:flutter/material.dart';
import 'package:flutter_first_ui/components/user_list_tile.dart';

///A custom listview bulder widget that displays a list of [UserListTile] widgets.
///This widget can be used in a user view screen or any other screen where you need a list of list tiles.
///The [UserListviewbuilder] takes [status] and [icon] as parameters and returns a [ListView.builder] with the specified properties.
//Example:
//UserListviewbuilder(
//  status: ['Available', 'Busy', 'Away'],
//  icon: Icons.circle,
//)
//The above example creates a list view with three list tiles, each displaying a status and an icon.
class UserListviewbuilder extends StatefulWidget {
  //The list of status strings to display in the list view.
  final List<String> status;
  //The icon to display in each list tile.
  final IconData icon;
  //Constructor for [UserListviewbuilder].
  ///The [status] and [icon] parameters are required.
  ///The [key] parameter is optional.
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

  ///Builds the [UserListviewbuilder] widget.
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.status.length, //The number of items in the list view
      itemBuilder: (BuildContext context, index) {
        //Builds each list tile with the specified status and icon
        return UserListTile(
          text: widget.status[index], //The status text
          icon: widget.icon, //The icon to display
        );
      },
    );
  }
}
