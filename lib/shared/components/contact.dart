import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void whatsappLink({
  required String phone,
   String? message,
  required BuildContext context,
})async{
  url(){
    if(Platform.isAndroid){
      return "whatsapp://send?phone=$phone";
    }else{
      return"whatsapp://wa.me/$phone}";

    }
  }
  // ignore: unnecessary_null_comparison
  await canLaunch(url()) ? launch(url()):
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(backgroundColor: Colors.red,
        content: Text('There is no Whatsapp on your Device')),
  );
}


void callingLink({
  required String phone,
  required BuildContext context

})async{
  String url = "tel:$phone";
  // ignore: unnecessary_null_comparison
  await canLaunch(url) ? launch(url):
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(backgroundColor: Colors.red,
        content: Text('error ')),
  );
}



void messengerLink({
  required String userName,
  required BuildContext context

})async{
  String url = "http://m.me/$userName";
  // ignore: unnecessary_null_comparison
  await canLaunch(url) ? launch(url):
  ScaffoldMessenger.of(context).showSnackBar(

    const SnackBar(backgroundColor: Colors.red,
        content: Text('error ')),
  );
}