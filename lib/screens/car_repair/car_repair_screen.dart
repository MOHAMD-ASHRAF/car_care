import '../../shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CarRepairScreen extends StatelessWidget {
  const CarRepairScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: appPrimaryColor,
        title: Center(child: Text('Car Repair')),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder:(context, index) => SizedBox(height: 15,),
          itemCount: 20,
          itemBuilder:(context, index) => buildListViewItem(),
        ),
      ),
    );
  }
}

Widget buildListViewItem()=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
        border: Border.all(color: Colors.transparent,)
    ),
    child: ListTile(
      dense: true,
      leading: CircleAvatar(
        radius: 30,
        backgroundImage:NetworkImage('https://yt3.ggpht.com/ytc/AKedOLRpe2Lbdy5gdRrTFKEK2ZvC1cQSv1gxjx7lV0_Nkg=s900-c-k-c0x00ffffff-no-rj',),
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
