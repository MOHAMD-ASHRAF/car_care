import 'package:car_care/cubit/app_state.dart';
import 'package:car_care/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/constants/app_colors.dart';
import '../details_of_car_repair/motor_details.dart';


class MotorRepairScreen extends StatelessWidget {
  const MotorRepairScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context ,state){},
      builder: (context ,state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).getMotorWorker != null,
          builder: (context) => Scaffold(
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
                itemCount: AppCubit.get(context).getMotorWorker!.worker!.length,
                itemBuilder:(context, index) => buildListViewItem(context,index),
              ),
            ),
          ),
          fallback: (context) =>Center(child: CircularProgressIndicator(color: Colors.red,),),
        );
      },
    );
  }
}










Widget buildListViewItem(context,index)=>Container(
  child:Material(
    elevation: 7,
    shadowColor: appPrimaryColor,
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    child: ListTile(
      onTap: (){
        // navigateTo(context, CarRepairDetailsScreen());
        Navigator.push(context , MaterialPageRoute(builder: (context) => MotorCarRepairDetailsScreen(index))
        );
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
            backgroundImage:NetworkImage('${AppCubit.get(context).getMotorWorker!.worker![index].url}'),
          ),
        ],
      ),
      title: Text('${AppCubit.get(context).getMotorWorker!.worker![index].name}',
        style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold ,color:appPrimaryColor),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,),
      subtitle: Text('motor',style: TextStyle(fontSize: 15)),
      trailing: Icon(Icons.remove_red_eye_outlined , color:appPrimaryColor, size: 30,),
    ),
  ),
);