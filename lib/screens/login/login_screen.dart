import 'package:car_care/screens/login/cubit/google_login_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../network/local/cache_helper.dart';
import '../../shared/components/default_button.dart';
import '../../shared/components/form_field.dart';
import '../../shared/components/toast.dart';
import '../main_screens/home_screen.dart';
import '../sing_up/sing_up._screen.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    bool? checked = false;
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider<GoogleSign>(
          create: (BuildContext context) => GoogleSign(LoginInitialState),
        ),
      ],
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status.toString() == 'success') {
              CacheHelper.saveData(key: 'token', value: state.loginModel.token).then((value) {
                navigateAndFinish(context, HomeScreen());
              });
              print(state.loginModel.status);
              print(state.loginModel.token);
              showToast(
                text: state.loginModel.message!,
                state: ToastStates.SUCCESS,
              );
            } else {
              print(state.loginModel.status);
              showToast(
                text: state.loginModel.message!,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              body: Stack(
                children: [
                  backGround(),
                  SingleChildScrollView(
                    reverse: true,
                    physics: BouncingScrollPhysics(),
                    child: SafeArea(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 320,
                            ),
                            if (!isKeyboard) buildLogo(),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
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
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  defaultField(
                                      onSubmitted: (value) {
                                        if (formKey.currentState!.validate()) {
                                          LoginCubit.get(context).getUserOne(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                        }
                                      },
                                      obscureText:
                                          LoginCubit.get(context).isPassword,
                                      controller: passwordController,
                                      //width: double.infinity,
                                      typeOfInput: TextInputType.emailAddress,
                                      suffix: LoginCubit.get(context).suffix,
                                      suffixPressed: () {
                                        LoginCubit.get(context)
                                            .changePasswordVisibility();
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
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: checked,
                                          onChanged: (value) {}),
                                      Text('Remember Me',
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 16,
                                          )),
                                    ],
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
                                            if (formKey.currentState!
                                                .validate()) {
                                              LoginCubit.get(context)
                                                  .getUserOne(
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text);
                                            }
                                          }),
                                      condition: state is! LoginLodingState,
                                      fallback: (context) => Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.red)),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  GestureDetector(
                                    child: Text('GoogleSignIn'),
                                    onTap: () {
                                      GoogleSign(LoginInitialState)
                                          .googleLogin();
                                    },
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            navigateTo(context, SingUpScreen());
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget backGround() => Container(
    width: double.infinity,
    height: double.infinity,
    child: Image(
      image: AssetImage('assets/images/3.png'),
      fit: BoxFit.cover,
    ));

Widget defaultText({required String text}) => Text(text,
    style: TextStyle(
      color: Colors.grey[500],
      fontSize: 16,
    ));
Widget buildLogo({final urlLogo = 'assets/images/logo.png'}) => Container(
      width: double.infinity,
      height: 150,
      child: Image(
        image: AssetImage(urlLogo),
        fit: BoxFit.cover,
      ),
    );
