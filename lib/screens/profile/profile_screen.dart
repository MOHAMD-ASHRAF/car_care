
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/card_info.dart';
import '../../shared/components/defult_button.dart';
import '../../shared/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
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
           // navigateTo(context, ProfileScreen());
          },
            child: Icon(Icons.edit,color: Colors.white,size: 25,),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7)),
            color: appPrimaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column
              (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage:NetworkImage('https://sg-res.9appsdownloading.com/sg/res/jpg/57/f8/b0605445fa2c1d60b50c9875731d-add.jpg?x-oss-process=style/hq',),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5, bottom: 2),
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5, bottom: 2),
                      child: CircleAvatar(
                        radius: 15,
                        child: Icon(Icons.camera_alt_outlined , color: Colors.white,),
                        backgroundColor: appPrimaryColor ,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  'Mohamed Ashraf Ali',style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: appPrimaryColor),),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('@moHego',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold,color: appPrimaryColor),),
                    SizedBox(width: 100,),
                    Text('client',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold,color: Colors.black),),
                  ],
                ),
                SizedBox(height: 10,),
                cardInfo(
                  text: ('mohamed ashraf mohamed '),
                  icon: Icons.person,
                ),
                SizedBox(height: 5,),
                cardInfo(
                  text: ('@mohegoooo'),
                  icon: Icons.email,
                ),
                SizedBox(height: 10,),
                cardInfo(
                  text: ('01022953656'),
                  icon: Icons.phone,
                ),
                SizedBox(height: 5,),
                cardInfo(
                  text: ('current password'),
                  icon: Icons.password,
                ),
                SizedBox(height: 5,),
                cardInfo(
                  text: ('account type'),
                  icon: Icons.account_box_outlined,
                ),
                SizedBox(height: 5,),
                cardInfo(
                  text: ('language'),
                  icon: Icons.language,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
