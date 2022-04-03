
import '../model/get_user_data_model.dart';
import '../model/worker_login_model.dart';
import '../model/worker_register_model.dart';

abstract class AppState {}

class AppInitialState extends AppState {}

class ProfileImagePikerSuccessState extends AppState {}

class ProfileImagePikerErrorState extends AppState {}

class WorkerLoginLoadingState extends AppState {}
class WorkerLoginSuccessState extends AppState {
  final WorkerLoginModel workerloginModel;
  WorkerLoginSuccessState(this.workerloginModel);
}
class WorkerLoginErrorState extends AppState {
  final String error;
  WorkerLoginErrorState(this.error);
}

class WorkerRegisterLoadingState extends AppState {}
class WorkerRegisterSuccessState extends AppState {
  final WorkerRegisterModel workerRegisterModel;
  WorkerRegisterSuccessState(this.workerRegisterModel);
}
class WorkerRegisterErrorState extends AppState {
  final String error;
  WorkerRegisterErrorState(this.error);
}





class UserDataLoadingState extends AppState {}
class UserDataSuccessState extends AppState {
  final GetUserFromId userModel;
  UserDataSuccessState(this.userModel);
}
class UserDataErrorState extends AppState {
  final String error;
  UserDataErrorState(this.error);
}

