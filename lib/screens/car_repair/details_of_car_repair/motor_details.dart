

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../cubit/app_state.dart';
import '../../../cubit/cubit.dart';
import '../../../shared/components/default_button.dart';
import '../../../shared/components/form_field.dart';
import '../../../shared/components/show_model.dart';
import '../../../shared/constants/app_colors.dart';

class MotorCarRepairDetailsScreen extends StatelessWidget {
   double rating=0;
  final int index;
  MotorCarRepairDetailsScreen(this.index);
  @override
  Widget build(BuildContext context,) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context, state) {},
      builder: (context,state) {
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
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage:NetworkImage('${AppCubit.get(context).getMotorWorker!.worker![index].url}'),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      '${AppCubit.get(context).getMotorWorker!.worker![index].name}',
                      style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,color: appPrimaryColor),maxLines: 2,),
                    SizedBox(height: 10,),
                    Text('rating = $rating'),
                    RatingBar.builder(
                      maxRating: 1,
                      itemSize: 40,
                      itemPadding: EdgeInsets.symmetric(horizontal: 5),
                      itemBuilder: (context,_)=> Icon(Icons.star,color: Colors.amber,),
                      updateOnDrag: true,
                      onRatingUpdate: (rating) => this.rating = rating,
                    ),
                    SizedBox(height: 30,),
                    information(describe: 'Specialization' , text: 'motor'),
                    SizedBox(height: 20,),
                    information(describe: 'E-mail' , text: 'email'),
                    SizedBox(height: 20,),
                    information(describe: 'Phone Number' , text: '${AppCubit.get(context).getMotorWorker!.worker![index].phone}'),
                    SizedBox(height: 20,),
                    information(describe: 'location' , text: 'location'),

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
                  openModel(context: context,index: index, phone: '${AppCubit.get(context).getMotorWorker!.worker![index].phone}');
                }
                )
            ),
          ],
        );
      },
    );
  }
}