import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:car_care/cubit/app_state.dart';
import 'package:car_care/cubit/cubit.dart';
import 'package:car_care/screens/main_screens/home_screen.dart';
import 'package:car_care/screens/onBoarding/onboarding_screen.dart';
import 'package:car_care/screens/user_or_worker/user_or_worker_screen.dart';
import 'package:car_care/shared/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'bloc_observer.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();


  late Widget widget;
  String token = CacheHelper.getData(key: 'token')??'';
  bool onBoarding = CacheHelper.getData(key: 'onBoarding')??false;
  print (token);


  if(onBoarding){
    if(token.isNotEmpty) widget =HomeScreen();
    else widget = UserOrWorkerScreen();
  } else{
    widget =  OnBoardingScreen();
  }


  BlocOverrides.runZoned(
    () {
      runApp(
        MyApp(
            widget,
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
  // runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
   Widget widget;
  MyApp(
      this.widget,
      );

  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => AppCubit()..getUserData()..getWorkerData()..getAnotherWorkerData()..getElectronicWorkerData()..getMotorWorkerData()),
        ],
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                appBarTheme: AppBarTheme(
                  color: appPrimaryColor,
                ),
              ),
              home: AnimatedSplashScreen(
                splash: Lottie.asset('assets/animation/gears.json'),
                nextScreen: widget,
                splashTransition: SplashTransition.decoratedBoxTransition,
              ),
            );
          },
        )
    );
  }
}
