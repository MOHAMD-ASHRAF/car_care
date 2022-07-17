

import 'package:car_care/cubit/app_state.dart';
import 'package:car_care/cubit/cubit.dart';
import 'package:car_care/screens/worker/worker_register_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/local/cache_helper.dart';
import '../../shared/components/default_button.dart';
import '../../shared/components/form_field.dart';
import '../../shared/components/toast.dart';
import '../main_screens/home_screen.dart';
import '../sing_up/sing_up._screen.dart';

class WorkerLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom!= 0;
    bool? checked = false;
   // var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit,AppState>(
      listener: (context,state) {
        if (state is WorkerLoginSuccessState) {
          if (state.workerloginModel.status.toString() == 'success') {
            CacheHelper.saveData(key: 'token', value: state.workerloginModel.token).then((value) {
              navigateAndFinish(context, HomeScreen());
            });
            print(state.workerloginModel.status);
           print(state.workerloginModel.token);
            showToast(
              text: state.workerloginModel.message!,
              state: ToastStates.SUCCESS,
            );
            // navigateAndFinish(context, HomeScreen());
          } else {
            print(state.workerloginModel.status);
            showToast(
              text: state.workerloginModel.message!,
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context,state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                backGround(),
                SafeArea(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isKeyboard) buildLogo(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 16,
                                  ),
                              ),
                              SizedBox(height: 5),
                              defaultField(
                                  controller: emailController,
                                  typeOfInput: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                            .hasMatch(value)) {
                                      return 'Enter correct email';
                                    }
                                    return null;
                                  }),
                              SizedBox(height: 10),
                              Text('Password',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 16,
                                  )
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              defaultField(
                                  onSubmitted: (value) {
                                  },
                                  obscureText:  true,
                                  controller: passwordController,
                                  typeOfInput: TextInputType.emailAddress,
                                 // suffix: LoginCubit.get(context).suffix,
                                  suffixPressed: () {
                                  },
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'password is empty';
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Spacer(),
                              Center(
                                child: ConditionalBuilder(
                                  builder: (context) => defaultButton(
                                      width: 150,
                                      color: Colors.black,
                                      colorText: Colors.white,
                                      text: 'Log in',
                                      function: () {
                                        if (formKey.currentState!.validate()) {
                                          AppCubit.get(context).workerLogin(
                                              email:
                                              emailController.text,
                                              password:
                                              passwordController.text
                                          );
                                         }
                                        }
                                      ),
                                  condition: state is! WorkerLoginLoadingState,
                                  fallback: (context) => Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.red)
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        navigateTo(context, WorkerRegisterScreen());
                                      },
                                      child: Text(
                                        'Sing UP',
                                        style:
                                        TextStyle(color: Colors.black),
                                      )),
                                  Spacer(),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Forget Password?',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



Widget backGround() => Container(
    width: double.infinity,
    height: 370,
    child: Image(
      image: AssetImage('assets/images/lgin.png'),
      fit: BoxFit.fill,
    ));

Widget defaultText({required String text}) => Text(text,
    style: TextStyle(
      color: Colors.grey[500],
      fontSize: 16,
    ));
Widget buildLogo({final urlLogo = 'assets/images/logo2.png'}) => Center(
  child:   Container(
    width: 200,
    height: 100,
    child: Image(
      image: AssetImage(urlLogo),
      fit: BoxFit.cover,
    ),
  ),
);