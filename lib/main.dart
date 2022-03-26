import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:car_care/cubit/app_state.dart';
import 'package:car_care/cubit/cubit.dart';
import 'package:car_care/screens/car_repair/car_repair_screen.dart';
import 'package:car_care/screens/main_screens/home_screen.dart';
import 'package:car_care/screens/onBoarding/onboarding_screen.dart';
import 'package:car_care/shared/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'bloc_observer.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => AppCubit()),
        ],
        child: BlocConsumer<AppCubit,AppState>(
          listener: (context  , state) {},
          builder: (context  , state) {
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
                nextScreen: HomeScreen(),
                splashTransition: SplashTransition.decoratedBoxTransition,
              ),
            );
          },
        )
    );
  }
}
