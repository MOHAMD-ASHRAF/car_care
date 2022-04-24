import 'package:flutter/material.dart';

import 'contact.dart';


Future openModel({context,index, required String phone })=> showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20) ,topRight: Radius.circular(20) ),
    ),
    context: context,
    builder: (context) => Container(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                whatsappLink(context: context, phone: phone);
              },
              child: Row(
                children: [
                  Icon(Icons.whatsapp ,color: Colors.green,size: 30,),
                  SizedBox(width: 10,),
                  Text('whats',style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                callingLink(phone: phone, context: context);
                //messengerLink(userName: 'mohamedhossam.mohamed.3', context: context);
              },
              child: Row(
                children: [
                  Icon(Icons.phone ,color: Colors.pink,size: 30,),
                  SizedBox(width: 10,),
                  Text('phone',style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
          ],
        ),
      ),
    )
);


///////////////////////////////////////////////////////////////////////openDialog/////////////////////////////////////////////////////////
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
