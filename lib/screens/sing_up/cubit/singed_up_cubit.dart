
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../model/singed_up_model.dart';
import '../../../network/end_point.dart';
import '../../../network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'singed_up_state.dart';

class SingedUpCubit extends Cubit<SingedUpState>
{
  late SingedUpModel singedUpModel;
  SingedUpCubit() : super(SingedUpInitialState());
  static SingedUpCubit get(context) => BlocProvider.of(context);



  //used try and catch
  void getUserOne ({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
    required String phone,
  }) async{
    emit(SingedUpLodingState());
    try{
      var response = await DioHelper.postData(
        data: {'email': email, 'password': password , 'name' : name , 'confirmPassword': confirmPassword , 'phone' : phone }, url: SINGED_IN,
      );
      print(response.data);
      print(response.statusCode);
      late SingedUpModel singedUpModel;
      singedUpModel= SingedUpModel.fromJson(response.data);
      emit(SingedUpSuccessState(singedUpModel));
    }on DioError catch(e){
      debugPrint("${e.response!.data}");
      debugPrint("${e.response!.statusCode}");
      // print(e.response!.data);
      singedUpModel= SingedUpModel.fromJson(e.response!.data);
      emit(SingedUpSuccessState(singedUpModel));
    }
    catch(e){
      print(e.toString());
      emit(SingedUpErrorState(e.toString()));
    }
  }






  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(SingedUpSChangPasswordVisibilityState());
  }
}
