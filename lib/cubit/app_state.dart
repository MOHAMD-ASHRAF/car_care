
import '../model/get_user_data_model.dart';
import '../model/get_worker_model.dart';
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



class WorkerDataLoadingState extends AppState {}
class WorkerDataSuccessState extends AppState {
  final getWorkerModel;
  WorkerDataSuccessState(this.getWorkerModel);
}
class WorkerDataErrorState extends AppState {
  final String error;
  WorkerDataErrorState(this.error);
}



class ElectronicWorkerDataLoadingState extends AppState {}
class ElectronicWorkerDataSuccessState extends AppState {
  final getElectronicWorkerModel;
  ElectronicWorkerDataSuccessState(this.getElectronicWorkerModel);
}
class ElectronicWorkerDataErrorState extends AppState {
  final String error;
  ElectronicWorkerDataErrorState(this.error);
}




class MotorWorkerDataLoadingState extends AppState {}
class  MotorWorkerDataSuccessState extends AppState {
  final getMotorWorkerModel;
  MotorWorkerDataSuccessState(this.getMotorWorkerModel);
}
class  MotorWorkerDataErrorState extends AppState {
  final String error;
  MotorWorkerDataErrorState(this.error);
}




class AnotherWorkerDataLoadingState extends AppState {}
class  AnotherWorkerDataSuccessState extends AppState {
  final getAnotherWorkerModel;
  AnotherWorkerDataSuccessState(this.getAnotherWorkerModel);
}
class  AnotherWorkerDataErrorState extends AppState {
  final String error;
  AnotherWorkerDataErrorState(this.error);
}
