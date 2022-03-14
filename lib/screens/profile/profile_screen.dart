
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../shared/components/card_info.dart';
import '../../shared/constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;

  Future pickImage() async {
   try{
     final image= await ImagePicker().pickImage(source: ImageSource.gallery);
     if(image == null) return;
     final imageTemporary = File (image.path);
     setState(() => this.image = imageTemporary);
   } on PlatformException catch(e){
     print('failed to pick image $e');
   }
  }

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
                      //backgroundImage: image != null ? Image.file(image!,fit: BoxFit.cover),
                      backgroundColor: Colors.yellow,
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
                        child: Container(child: IconButton(icon: Icon(Icons.camera_alt_outlined), color: Colors.white, onPressed: () =>openDialog(context),iconSize: 16,)),
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

Future openDialog(context) =>showDialog(
    context: context,
    builder: (context) =>AlertDialog(
      title: Text('chose option'),
      content: Container(
        height: 80,
        child: Column(
          children: [
            InkWell(
              onTap: (){},
              child: Row(
                children: [
                  Icon(Icons.image ,color: Colors.green,),
                  SizedBox(width: 10,),
                  Text('from phone'),
                ],
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){},
              child: Row(
                children: [
                  Icon(Icons.camera_alt ,color: Colors.pink,),
                  SizedBox(width: 10,),
                  Text('camera'),
                ],
              ),
            ),
          ],
        ),
      ),
    )
);

