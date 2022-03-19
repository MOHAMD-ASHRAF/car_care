import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:car_care/screens/onBoarding/onbording_screen.dart';
import 'package:car_care/shared/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(),
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/trs.png'),
        nextScreen: OnBoardingScreen(),
        splashTransition: SplashTransition.decoratedBoxTransition,
      ),
    );
  }
}
