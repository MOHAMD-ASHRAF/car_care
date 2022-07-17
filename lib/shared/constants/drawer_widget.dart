import 'package:car_care/cubit/app_state.dart';
import 'package:car_care/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/local/cache_helper.dart';
import '../../screens/about_us/about_us_screen.dart';
import '../../screens/car_service/car_service.dart';
import '../../screens/main_screens/home_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/recovery/recovery_screen.dart';
import '../../screens/spare_parts/spare_screen.dart';
import '../../screens/user_or_worker/user_or_worker_screen.dart';
import '../components/default_button.dart';
import '../components/form_field.dart';
import 'app_colors.dart';
import 'package:flutter/material.dart';



class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
     listener: (context,state) {},
      builder: (context,state) {
        var cubit = AppCubit.get(context);
        var profileImage  = AppCubit.get(context).profileImage;
       return SafeArea(
         child: Drawer(
           backgroundColor: Colors.grey[200],
           child: ListView(
             children: <Widget>[
           Padding(
           padding: const EdgeInsets.only(top: 20),
           child:  InkWell(
             onTap: (){
               navigateTo(context,ProfileScreen());
             },
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(43),
                   topRight: Radius.circular(10),
                   bottomLeft: Radius.circular(43),
                   bottomRight: Radius.circular(10),
                 ),
                 color: Colors.grey[400],
               ),
               margin: EdgeInsets.all(15),
               child: Row(
                 children: [
                   CircleAvatar(
                     radius: 43,
                     backgroundColor: Colors.black,
                     child: CircleAvatar(
                       radius: 40,
                       backgroundImage: profileImage == null ? NetworkImage(
                           '${cubit .userModel!.user!.url}'
                       ) : FileImage(profileImage) as ImageProvider,
                     ),
                   ),
                   SizedBox(
                     width: 15,
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: [
                       Text('${cubit .userModel!.user!.name}'
                         ,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ,color: appPrimaryColor,),maxLines: 1,overflow: TextOverflow.ellipsis,),
                       Text('client'
                         ,style: TextStyle(fontSize: 16  ,color: appPrimaryColor),),
                     ],
                   ),
                 ],
               ),
             ),
           ),
         ),
               buildDrawerItem(itemIcon: Icons.home, itemTitle: "Home",function: () {navigateTo(context, HomeScreen());}),
               buildDrawerItem(
                   itemIcon: Icons.construction, itemTitle: "Recovery",function: () {navigateTo(context, RecoveryScreen());}),
               buildDrawerItem(
                   itemIcon: Icons.construction, itemTitle: "Spare Parts",function: () {navigateTo(context, SpareScreen());}),
               buildDrawerItem(
                   itemIcon: Icons.construction, itemTitle: "Car Services",function: () {navigateTo(context, CarServices());}),
               buildDrawerItem(
                   itemIcon: Icons.construction, itemTitle: "Parking",function: () {navigateTo(context, RecoveryScreen());}),
               buildDrawerItem(
                   itemIcon: Icons.construction, itemTitle: "Buy & SELL",function: () {navigateTo(context, RecoveryScreen());}),
               buildDrawerItem(
                   itemIcon: Icons.construction, itemTitle: "car service",function: () {navigateTo(context, RecoveryScreen());}),
               buildDrawerItem(
                   itemIcon: Icons.info_outline, itemTitle: "About us ",function: () {navigateTo(context, AboutUsScreen());}),
               buildDrawerItem(
                   itemIcon: Icons.document_scanner_outlined, itemTitle: "TERMS AND CONDITIONS",function: () {navigateTo(context, RecoveryScreen());}),
               buildDrawerItem(
                   itemIcon: Icons.privacy_tip_outlined, itemTitle: "Privacy Police",function: () {navigateTo(context, RecoveryScreen());}),
               buildDrawerItem(
                   itemIcon: Icons.construction, itemTitle: "Contact Us",function: () {navigateTo(context, RecoveryScreen());}),
               InkWell(
                   onTap: (){
                     CacheHelper.removeData(key: 'token').then((value){
                       if(value)
                       {
                         navigateAndFinish(context, UserOrWorkerScreen());
                       }
                     });
                   },
                   child: defaultButton(colorText: Colors.white, color: Colors.black, text: 'SIGN OUT', width: 20)),
             ],
           ),
         ),
       );
      },
    );
  }
}











Widget buildDrawerItem(
    {
      required IconData itemIcon,
      required String itemTitle,
      required GestureTapCallback function
    }
    ) {
  return InkWell(
    onTap: function,
    child: ListTile(
      minLeadingWidth: 10,
      leading: Icon(
        itemIcon,
        color: Colors.black,
      ),
      title: Text(
        itemTitle,
        style: TextStyle( color: Colors.grey,fontSize: 18),
      ),
    ),
  );
}
