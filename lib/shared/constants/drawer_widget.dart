import '../../screens/about_us/about_us_screen.dart';
import '../../screens/car_service/car_service.dart';
import '../../screens/main_screens/home_screen.dart';
import '../../screens/recovery/recovery_screen.dart';
import '../../screens/spare_parts/spare_screen.dart';
import '../components/default_button.dart';
import 'app_colors.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Material(
          color: backgroundColor,
          child: ListView(
            children: <Widget>[
              buildHeader(context),
              buildDrawerItem(itemIcon: Icons.home, itemTitle: "Home",function: () {navigateTo(context, HomeScreen());}),
              buildDrawerItem(
                  itemIcon: Icons.construction, itemTitle: "Recovery",function: () {navigateTo(context, RecoveryScreen());}),
              buildDrawerItem(
                  itemIcon: Icons.construction, itemTitle: "Spare Parts",function: () {navigateTo(context, SpareScreen());}),
              buildDrawerItem(
                  itemIcon: Icons.construction, itemTitle: "Car Services",function: () {navigateTo(context, CarServices());}),
              buildDrawerItem(
                  itemIcon: Icons.info_outline, itemTitle: "About us ",function: () {navigateTo(context, AboutUsScreen());}),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildDrawerItem(
    {required IconData itemIcon, required String itemTitle,required GestureTapCallback function}) {
  return InkWell(
    onTap: function,
    child: ListTile(
      leading: Icon(
        itemIcon,
        color: appPrimaryColor,
      ),
      title: Text(
        itemTitle,
        style: TextStyle(color: appPrimaryColor),
      ),
    ),
  );
}
Widget buildHeader(context) => Container(
  color: appPrimaryColor,
  padding: EdgeInsets.only(
    top: 25+ MediaQuery.of(context).padding.top,
    bottom: 25,
  ),
  child: Column(
    children: [
      CircleAvatar(
        radius: 52,
        backgroundImage: NetworkImage('https://static.dw.com/image/43516410_303.jpg'),
      ),
      SizedBox(
        height: 10,
      ),
      Text('mo salah',style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ,color: Colors.white),),
      Text('player',style: TextStyle(fontSize: 16  ,color: Colors.white),),
    ],
  ),
);