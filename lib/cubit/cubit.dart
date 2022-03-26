import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);









   File? profileImage;
  var picker =ImagePicker();



  Future<void> getProfileImageFromGallery(BuildContext context) async{
    final pikedFile = await picker.pickImage(source: ImageSource.gallery);
     if (pikedFile != null){
       Navigator.of(context).pop();
       profileImage =File(pikedFile.path);
       emit(ProfileImagePikerErrorState());
     }else
       {
         print('no image selected');
         emit(ProfileImagePikerErrorState());
       }
  }



  Future<void> getProfileImageFromCamera(BuildContext context) async{
    final pikedFile = await picker.pickImage(source: ImageSource.camera);
    if (pikedFile != null){
      Navigator.of(context).pop();
      profileImage =File(pikedFile.path);
      emit(ProfileImagePikerErrorState());
    }else
    {
      print('no image selected');
      emit(ProfileImagePikerErrorState());
    }
  }























}