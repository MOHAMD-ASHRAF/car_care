
import 'package:car_care/model/login_model.dart';
import 'package:car_care/network/local/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../network/end_point.dart';
import '../../../network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState>
{
  late LoginModel loginModel;
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);




  //used then and catchError
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLodingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      print(value.data);
      loginModel= LoginModel.fromJson(value.data);
      print(loginModel.status);
      print(loginModel.token);
      print(loginModel.user!.name);
      print(loginModel.user!.email);
      print(loginModel.user!.id);

      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }




  //used try and catch
  void getUserOne ({
    required String email,
    required String password,
}) async{
    emit(LoginLodingState());
    try{
      var response = await DioHelper.postData(
        data: {'email': email, 'password': password}, url: LOGIN,
      );

      print(response.data);
      print(response.statusCode);
      loginModel= LoginModel.fromJson(response.data);
      CacheHelper.saveData(key: 'idNumber', value: response.data['user']['_id']);
      print(response.data['_id']);
      emit(LoginSuccessState(loginModel));
    }on DioError catch(e){
      debugPrint("${e.response!.data}");
      debugPrint("${e.response!.statusCode}");
     // print(e.response!.data);
      loginModel= LoginModel.fromJson(e.response!.data);
      emit(LoginSuccessState(loginModel));
    }
    catch(e){
      print(e.toString());
      emit(LoginErrorState(e.toString()));
    }
  }








  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(LoginSChangPasswordVisibilityState());
  }
}
