import 'package:flutter/cupertino.dart';

import '../../shared/components/default_button.dart';
import '../../shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'car_repaier_details_screen.dart';

class CarRepairScreen extends StatelessWidget {
  const CarRepairScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Car Repair',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          MaterialButton(
            minWidth: 10,
            height: 10,
            onPressed: (){
              //navigateTo(context, ProfileScreen());
            },
            child: Icon(
              Icons.search,
              color: Colors.white,
            ))
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7)),
            gradient: LinearGradient(
              colors: [appPrimaryColor,Colors.red],
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder:(context, index) => SizedBox(height: 20,),
          itemCount: 20,
          itemBuilder:(context, index) => buildListViewItem(context),
        ),
      ),
    );
  }
}

Widget buildListViewItem(context)=>Container(
  child:Material(
    elevation: 7,
     shadowColor: appPrimaryColor,
     color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    child: ListTile(
      onTap: (){
        navigateTo(context, CarRepairDetailsScreen());
      },
      dense: true,
      leading: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: appPrimaryColor ,
          ),
          CircleAvatar(
            radius: 22,
            backgroundImage:NetworkImage('https://therealchamps.com/wp-content/uploads/getty-images/2017/07/1360439294.jpeg',),
          ),
        ],
      ),
      title: Text('Mohamed Ashraf Mohamed Ali',
        style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold ,color:appPrimaryColor),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,),
      subtitle: Text('Car Repair',style: TextStyle(fontSize: 15)),
      trailing: Icon(Icons.remove_red_eye_outlined , color:appPrimaryColor, size: 30,),

    ),
  ),
);