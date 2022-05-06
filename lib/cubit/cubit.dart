
import 'package:car_care/model/electronic_worker_model.dart';
import 'package:car_care/model/get_worker_model.dart';
import 'package:car_care/model/login_model.dart';
import 'package:car_care/network/local/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../model/another_worker_model.dart';
import '../model/get_user_data_model.dart';
import '../model/motor_worker_model.dart';
import '../model/worker_login_model.dart';
import '../model/worker_register_model.dart';
import '../network/end_point.dart';
import '../network/remote/dio_helper.dart';
import 'app_state.dart';

import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';

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
       uploadPhoto(token: token,photo: profileImage);
       emit(ProfileImagePikerErrorState());

     }else
       {
         print('no image selected');
         emit(ProfileImagePikerErrorState());
       }
  }

  void uploadPhoto(
      {
        File? photo,
        String? token,
      }
      )async{

    FormData formData = FormData.fromMap({
      "image" : photo != null? await MultipartFile.fromFile(
        photo.path,
        contentType: MediaType('image','png'),
      ):null,
      //'token':token,
    });
    try {
      var response = await DioHelper.postData(url: UPLOAD_IMAGE, data:formData,token: token );
      emit(ProfileImagePikerSuccessState());
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      print(response.data);
    }on DioError catch(e){
      print('222222222');
      print(e.response!.statusCode);
      emit(ProfileImagePikerSuccessState());
    }catch(e){
      print('3333333333');
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
      debugPrint("${e.response!.statusCode}");
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
    required String location,
    required String specialized,
  }) async{
    emit(WorkerRegisterLoadingState());
    try{
      var response = await DioHelper.postData(
        data: {'email': email, 'password': password , 'name' : name , 'confirmPassword': confirmPassword , 'phone' : phone , 'location':  location,'specialized': specialized }, url: WORKER_REGISTER,
      );
      print(response.data);
      print(response.statusCode);
      print(response.data['specialized'].toString());
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



GetUserFromId? userModel;

  LoginModel? loginModel;
void getUserData()
  async{
  emit(UserDataLoadingState());
  String idNumber =CacheHelper.getData(key: 'idNumber');
  print(idNumber);
  await DioHelper.getData(url: GET_USER_DATA + idNumber).then(
          (value) {
            userModel = GetUserFromId.fromJson(value.data);
            print(userModel!.user!.name);
            print(userModel!.user!.sId);
            emit(UserDataSuccessState(
                userModel!
            ));
          }
  ).catchError((error){
    emit((UserDataErrorState(error.toString())));
    print(error.toString());
   }
  );
}

  void updateUserData({
  required String name,
  required String phone,
})
  async{
    emit(UpdateUserDataLoadingState());
    String idNumber =CacheHelper.getData(key: 'idNumber');
    print(idNumber);
    await DioHelper.patchData(
        url: UPDATE_PROFILE,
        token: token,
      data: {
          'name' : name,
          'phone' : phone,
      }
    ).then(
            (value) {
          userModel = GetUserFromId.fromJson(value.data);
          print(userModel!.user!.name);
          print(userModel!.user!.sId);
          emit(UpdateUserDataSuccessState(
              userModel!
          ));
        }
    ).catchError((error){
      emit((UpdateUserDataErrorState(error.toString())));
      print(error.toString());
    }
    );
  }



  GetWorkerModel? getWorkerModel;
  void getWorkerData()
  async{
    emit(WorkerDataLoadingState());
    //String idNumber =CacheHelper.getData(key: 'idNumber');
   // print(idNumber);
    await DioHelper.getData(url: Get_Worker_Data ).then(
            (value) {
              getWorkerModel =  GetWorkerModel.fromJson(value.data);
          print(getWorkerModel!.status);
          print(getWorkerModel!.message);
          print(getWorkerModel!.worker!.length);
          print(getWorkerModel!.worker![0].name);

          emit(WorkerDataSuccessState(
              getWorkerModel!
          ));
        }
    ).catchError((error){
      emit((WorkerDataErrorState(error.toString())));
      print(error.toString());
    }
    );
  }




  String token = CacheHelper.getData(key: 'token')??'';

  ElectronicWorkerModel? getElectronicWorker;
  void getElectronicWorkerData()
  async{
    emit(ElectronicWorkerDataLoadingState());
    //String idNumber =CacheHelper.getData(key: 'idNumber');
    // print(idNumber);
    await DioHelper.getData(url: Get_Worker_Electronic ,token: token).then(
            (value) {
              getElectronicWorker =  ElectronicWorkerModel.fromJson(value.data);
          // print(getElectronicWorker!.status);
          // print(getElectronicWorker!.length);
          // print(getElectronicWorker!.worker);
          emit(ElectronicWorkerDataSuccessState(
              getElectronicWorker!
          ));
        }
    ).catchError((error){
      emit((ElectronicWorkerDataErrorState(error.toString())));
      print(error.toString());
    }
    );
  }






  MotorWorkerModel? getMotorWorker;
  void getMotorWorkerData()
  {
    emit(MotorWorkerDataLoadingState());
    //String idNumber =CacheHelper.getData(key: 'idNumber');
    // print(idNumber);
    DioHelper.getData(url: Get_Worker_Motor,token: token).then(
            (value) {
          getMotorWorker =  MotorWorkerModel.fromJson(value.data);
          print(getMotorWorker!.status);
          print(getMotorWorker!.length);
          emit(MotorWorkerDataSuccessState(
              getMotorWorker!
          ));
        }
    ).catchError((error){
      emit((MotorWorkerDataErrorState(error.toString())));
      print(error.toString());
    }
    );
  }




  AnotherWorkerModel? getAnotherWorker;
  void getAnotherWorkerData()
  {
    emit(AnotherWorkerDataLoadingState());
    //String idNumber =CacheHelper.getData(key: 'idNumber');
    // print(idNumber);
    DioHelper.getData(url: Get_Worker_Another,token: token).then(
            (value) {
          getAnotherWorker =  AnotherWorkerModel.fromJson(value.data);
          print(getAnotherWorker!.status);
           print(getAnotherWorker!.length);
          emit(AnotherWorkerDataSuccessState(
              getAnotherWorker!
          ));
        }
    ).catchError((error){
      emit((AnotherWorkerDataErrorState(error.toString())));
      print(error.toString());
    }
    );
  }








}