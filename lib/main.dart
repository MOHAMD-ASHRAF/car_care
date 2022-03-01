import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'bloc_observer.dart';
import 'network/remote/dio_helper.dart';
import 'screens/login/login_screen.dart';
//import 'package:car_care/screens/main_screens/creat_account_screen.dart';
//import 'package:car_care/screens/main_screens/home_screen.dart';
//import 'package:car_care/screens/main_screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // Bloc.observer = MyBlocObserver();
  DioHelper.init();
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
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/trs.png'),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.decoratedBoxTransition,
      ),
    );
  }
}
