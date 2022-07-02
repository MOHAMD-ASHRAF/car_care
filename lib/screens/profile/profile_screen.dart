
import 'package:car_care/cubit/app_state.dart';
import 'package:car_care/cubit/cubit.dart';
import 'package:car_care/network/local/cache_helper.dart';
import 'package:car_care/screens/profile/update_proflle_screen.dart';
import 'package:car_care/screens/user_or_worker/user_or_worker_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/card_info.dart';
import '../../shared/components/default_button.dart';
import '../../shared/components/form_field.dart';
import '../../shared/constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var profileImage  = AppCubit.get(context).profileImage;
        return  ConditionalBuilder(
          condition: AppCubit.get(context).userModel != null,
          builder: (context) => Scaffold(
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
                   navigateTo(context, UpdateProfileScreen());
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
                            backgroundImage: profileImage == null ? NetworkImage(
                                '${cubit .userModel!.user!.url}'
                            ) : FileImage(profileImage) as ImageProvider,
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
                        '${cubit .userModel!.user!.name}',style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold,color: appPrimaryColor),),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${cubit.userModel!.user!.email}',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold,color: appPrimaryColor),),
                          SizedBox(width: 100,),
                          Text('client',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold,color: Colors.black),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      cardInfo(
                        text: ('${cubit .userModel!.user!.name}'),
                        icon: Icons.person,
                      ),
                      SizedBox(height: 5,),
                      cardInfo(
                        text: ('${cubit .userModel!.user!.email}'),
                        icon: Icons.email,
                      ),
                      SizedBox(height: 10,),
                      cardInfo(
                        text: ('${cubit .userModel!.user!.phone}'),
                        icon: Icons.phone,
                      ),
                      SizedBox(height: 5,),
                      cardInfo(
                        text: ('current password'),
                        icon: Icons.password,
                      ),
                      SizedBox(height: 5,),
                      cardInfo(
                        text: ('${cubit .userModel!.user!.sId}'),
                        icon: Icons.account_box_outlined,
                      ),
                      SizedBox(height: 5,),
                      cardInfo(
                        text: ('English'),
                        icon: Icons.language,
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                          onTap: (){
                            CacheHelper.removeData(key: 'token').then((value){
                              if(value)
                              {
                                navigateAndFinish(context, UserOrWorkerScreen());
                              }
                            });
                          },
                          child: defaultButton(colorText: Colors.white, color: appPrimaryColor, width: 150, text: 'SIGN OUT')),
                    ],
                  ),
                ),
              ),
            ),
          ),
          fallback: (context) =>Center(child: CircularProgressIndicator(color: appPrimaryColor,),)
        );
      }
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
              onTap: (){
                AppCubit.get(context).getProfileImageFromGallery(context);
              },
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
              onTap: (){
                AppCubit.get(context).getProfileImageFromCamera(context);
              },
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

