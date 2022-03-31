import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../model/worker_login_model.dart';
import '../model/worker_register_model.dart';
import '../network/end_point.dart';
import '../network/remote/dio_helper.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  File? profileImage;
  var picker =ImagePicker();
  late WorkerLoginModel  workerLoginModel;
  late WorkerRegisterModel workerRegisterModel;



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













  void workerLogin({
    required String email,
    required String password,
  }) async{
    emit(WorkerLoginLoadingState());
    try{
      var response = await DioHelper.postData(
        data: {'email': email, 'password': password}, url: WORKER_LOGIN,
      );
      print(response.data);
      print(response.statusCode);

      workerLoginModel= WorkerLoginModel.fromJson(response.data);
      emit(WorkerLoginSuccessState(workerLoginModel));

    }on DioError catch(e){
      debugPrint("${e.response!.data}");
      debugPrint("${e.response!.statusCode}hhhhhh");
      // print(e.response!.data);
      workerLoginModel= WorkerLoginModel.fromJson(e.response!.data);
      emit(WorkerLoginSuccessState(workerLoginModel));
    }
    catch(e){
      print(e.toString());
      emit(WorkerLoginErrorState(e.toString()));
    }
  }










  void workerRegister({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
    required String phone,
    required String idNumber,
    required String location,
  }) async{
    emit(WorkerRegisterLoadingState());
    try{
      var response = await DioHelper.postData(
        data: {'email': email, 'password': password , 'name' : name , 'confirmPassword': confirmPassword , 'phone' : phone , 'IDNumber' : idNumber , 'location':  location }, url: WORKER_REGISTER,
      );
      print(response.data);
      print(response.statusCode);
      late WorkerRegisterModel workerRegisterModel;
      workerRegisterModel= WorkerRegisterModel.fromJson(response.data);
      emit(WorkerRegisterSuccessState(workerRegisterModel));
    }on DioError catch(e){
      debugPrint("${e.response!.data}");
      debugPrint("${e.response!.statusCode}");
      // print(e.response!.data);
      workerRegisterModel= WorkerRegisterModel.fromJson(e.response!.data);
      emit(WorkerRegisterSuccessState(workerRegisterModel));
    }
    catch(e){
      print(e.toString());
      emit(WorkerRegisterErrorState(e.toString()));
    }
  }
























}