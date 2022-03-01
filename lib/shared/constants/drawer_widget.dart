import 'app_colors.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: backgroundColor,
        child: ListView(
          children: <Widget>[
            buildDrawerItem(itemIcon: Icons.home, itemTitle: "Home"),
            buildDrawerItem(
                itemIcon: Icons.construction, itemTitle: "Recovery"),
            buildDrawerItem(
                itemIcon: Icons.construction, itemTitle: "Spare Parts"),
            buildDrawerItem(
                itemIcon: Icons.construction, itemTitle: "Car Services"),
            buildDrawerItem(
                itemIcon: Icons.info_outline, itemTitle: "About us "),
          ],
        ),
      ),
    );
  }
}

Widget buildDrawerItem(
    {required IconData itemIcon, required String itemTitle}) {
  return ListTile(
    leading: Icon(
      itemIcon,
      color: appPrimaryColor,
    ),
    title: Text(
      itemTitle,
      style: TextStyle(color: appPrimaryColor),
    ),
  );
}
