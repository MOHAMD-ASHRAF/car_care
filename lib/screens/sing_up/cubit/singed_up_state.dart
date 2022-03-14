
import '../../../model/singed_up_model.dart';
abstract class SingedUpState {}

class SingedUpInitialState extends SingedUpState {}

class SingedUpLodingState extends SingedUpState {}

class SingedUpSuccessState extends SingedUpState {
  final SingedUpModel singedUpModel;

  SingedUpSuccessState(this.singedUpModel);
}

class SingedUpErrorState extends SingedUpState {
  final String error;
  SingedUpErrorState(this.error);
}

class SingedUpSChangPasswordVisibilityState extends SingedUpState {}