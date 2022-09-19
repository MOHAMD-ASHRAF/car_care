import 'package:car_care/screens/login/login_screen.dart';
import 'package:car_care/screens/worker/worker_login_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/components/default_button.dart';
import '../../shared/constants/app_colors.dart';
class UserOrWorkerScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(' WHO ARE YOU !' , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 70,),
                buildItem(
                    image: AssetImage('assets/images/mechanic.png'),
                    text: 'Worker',
                    function: () {
                      navigateTo(context,WorkerLoginScreen());
                    }),
                SizedBox(height: 30,),
                buildItem(
                    image: AssetImage('assets/images/man.png'),
                    text: 'user',
                    function: () {
                      navigateTo(context, LoginScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




Widget buildItem({
  required AssetImage image,
  required String text,
  GestureTapCallback? function,
})=>  Container(
  width: double.infinity,
  height : 280,
  child: InkWell(
    onTap: function,
    child: Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey[200],
                border: Border.all(color: appPrimaryColor, width: 6)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image(
                image: image,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      ],
    ),
  ),
);
