import 'package:flutter/material.dart';

import '../../shared/components/contact.dart';
import '../../shared/components/default_button.dart';
import '../../shared/components/form_field.dart';
import '../../shared/constants/app_colors.dart';

class CarRepairDetailsScreen extends StatelessWidget {

  var star = 4;
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
                Icons.menu,
                color: Colors.white,
              ))
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7)
            ),
            color: appPrimaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage:NetworkImage('https://vid.alarabiya.net/images/2020/01/07/b2fd1b6e-2a72-4038-b86b-985993fd4479/b2fd1b6e-2a72-4038-b86b-985993fd4479_16x9_1200x676.png?width=1138',),
                ),
                SizedBox(height: 20,),
                Text(
                  'mohamed ashraf',style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,color: appPrimaryColor),maxLines: 2,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: star >= 1 ? Colors.yellow: Colors.grey ,size: 40,),
                    Icon(Icons.star , color: star >= 2 ? Colors.yellow: Colors.grey ,size: 40,),
                    Icon(Icons.star , color: star >= 3 ? Colors.yellow: Colors.grey ,size: 40,),
                    Icon(Icons.star , color: star >= 4 ? Colors.yellow: Colors.grey ,size: 40,),
                    Icon(Icons.star , color: star >= 5 ? Colors.yellow: Colors.grey ,size: 40,),
                  ],
                ),
                SizedBox(height: 30,),
                information(describe: 'Specialization' , text: 'Electro mechanic'),
                SizedBox(height: 20,),
                information(describe: 'E-mail' , text: 'moashraf@gmail.com'),
                SizedBox(height: 20,),
                information(describe: 'Phone Number' , text: '01022953656'),
                SizedBox(height: 20,),
                information(describe: 'location' , text: 'El-Arish'),

              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Center(
            child: defaultButton(
              height: 50,
              text: 'Contact Information', colorText: Colors.white, color: appPrimaryColor, width: 200,function: (){
              openDialog(context);
            }
            )
        ),
      ],
    );
  }
}







Widget information({
  required String text,
  required String describe,
}) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text( '    $describe',
    style: TextStyle(fontSize: 20 , color: Colors.grey),),
    SizedBox(height: 5,),
    Container(
      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
      width: double.infinity,
      height: 30,
      child: Text(text, style: TextStyle(fontSize: 15 , color: Colors.black , fontWeight: FontWeight.bold),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey),
      ),
    ),
  ],
);




Future openDialog(context) =>showDialog(
    context: context,
    builder: (context) =>AlertDialog(
      title: Text('chose option'),
      content: Container(
        height: 80,
        child: Column(
          children: [
            InkWell(
              onTap: (){
                whatsappLink(context: context, phone: '+201022953656',);
              },
              child: Row(
                children: [
                  Icon(Icons.whatsapp ,color: Colors.green,),
                  SizedBox(width: 10,),
                  Text('whats'),
                ],
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                messengerLink(userName: 'mohamedhossam.mohamed.3', context: context);
              },
              child: Row(
                children: [
                  Icon(Icons.facebook ,color: Colors.pink,),
                  SizedBox(width: 10,),
                  Text('messanger'),
                ],
              ),
            ),
          ],
        ),
      ),
    )
);



Future openSheet(context)=> showModalBottomSheet(
    context: context,
    builder: (context) => Column(
      children: [
        Container(
          height: 80,
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  whatsappLink(context: context, phone: '+201022953656',);
                },
                child: Row(
                  children: [
                    Icon(Icons.whatsapp ,color: Colors.green,),
                    SizedBox(width: 10,),
                    Text('whats'),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  messengerLink(userName: 'mohamedhossam.mohamed.3', context: context);
                },
                child: Row(
                  children: [
                    Icon(Icons.facebook ,color: Colors.pink,),
                    SizedBox(width: 10,),
                    Text('messanger'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    )
);