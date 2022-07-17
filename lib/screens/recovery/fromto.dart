import 'package:car_care/screens/recovery/recovery_screen.dart';
import 'package:car_care/shared/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../shared/constants/app_colors.dart';


class FromToScreen extends StatefulWidget {
  @override
  State<FromToScreen> createState() => _FromToScreenState();
}

class _FromToScreenState extends State<FromToScreen> {
  var formKey = GlobalKey<FormState>();

  var fromController = TextEditingController();

  var toController = TextEditingController();
  List item =['Auto repair workshop','Auto repair workshop 2','electrical','another location'];
  String? selected= 'another location';
  var locationMessage = "";
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    var lastPosition =await Geolocator.getLastKnownPosition();
    print(lastPosition);

    setState((){
      locationMessage = "${position.latitude},${position.longitude}";
    });
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
          'Recovery Screen',
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
            },
            child:  Icon(Icons.menu,color: Colors.white,size: 30,),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7)),
            gradient: LinearGradient(
              colors: [appPrimaryColor,secondColor],
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100,),
                Center(
                  child: Container(
                    width: 200,
                      height: 200,
                      child: Image(
                        image: AssetImage('assets/images/recovery.png'),
                      )
                  ),
                ),
                Text('From',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold,color: appPrimaryColor ),),
                SizedBox(height: 10,),
                TextFormField(
                  controller: fromController,
                  decoration: InputDecoration(
                    hintText: '$locationMessage',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.grey[300],
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: (){
                        getCurrentLocation();
                      },
                      icon: Icon(
                        Icons.location_disabled_rounded,color: appPrimaryColor,
                      )
                    )
                  ),
                ),
                SizedBox(height: 30,),
                Text('To',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold,color: appPrimaryColor ),),
                SizedBox(height: 10,),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 1,)
                      ),
                    fillColor: Colors.grey[300],
                     filled: true,
                  ),
                  value:  selected,
                  items: item
                      .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item,style: TextStyle(fontSize: 15),)
                  )).toList(),
                  onChanged: (item) => selected = item.toString(),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                  width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                   color: appPrimaryColor,
                    borderRadius: BorderRadius.circular(7),
                    ),
                    child: MaterialButton(
                       onPressed: (){
                         navigateTo(context, RecoveryScreen());
                       },
                        child: Text('confirm',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 16)
                     )
                   ),
               ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
