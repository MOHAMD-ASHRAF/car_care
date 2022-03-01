import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/defult_button.dart';
import '../../shared/components/form_field.dart';
import '../sing_up/sing_up.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    bool? checked = false;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              backGround(),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: SafeArea(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                            child: Text(
                              'Welcome',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 100),
                            child: Text(
                              'Back!',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                          ),
                          Container(
                            width: double.infinity,
                            height: 150,
                            child: Image(
                              image: AssetImage('assets/logo.png'),
                              fit: BoxFit.cover,
                            ),
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
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                    )),
                                SizedBox(height: 5),
                                defaultField(
                                    controller: emailController,
                                    width: double.infinity,
                                    typeOfInput: TextInputType.emailAddress,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'email is empty';
                                      }
                                    }),
                                SizedBox(height: 10),
                                Text('Password',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                defaultField(
                                  onSubmitted: (value){
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text
                                      );
                                    }
                                  },
                                    obscureText: LoginCubit.get(context).isPassword,
                                    controller: passwordController,
                                    width: double.infinity,
                                    typeOfInput: TextInputType.emailAddress,
                                    suffix: LoginCubit.get(context).suffix,
                                    suffixPressed: (){
                                    LoginCubit.get(context).changePasswordVisibility();
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
                                        value: checked, onChanged: (value) {}),
                                    Text('Remember Me',
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 16,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: ConditionalBuilder(
                                    builder: (context) => defaultButton(
                                        width: 150,
                                        color: Colors.black,
                                        colorText: Colors.white,
                                        text: 'Log in',
                                        function: () {
                                          if (formKey.currentState!.validate()) {
                                            LoginCubit.get(context).userLogin(
                                                email: emailController.text,
                                                password: passwordController.text
                                            );
                                          }//navigateTo(context, HomeScreen());
                                        }),
                                    condition: state is! LoginLodingState,
                                    fallback: (context) => Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.red)),
                                  ),
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          navigateTo(context, SingUpScreen());
                                        },
                                        child: Text(
                                          'Sing UP',
                                          style: TextStyle(color: Colors.black),
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
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget backGround() => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/3.png'),
          fit: BoxFit.cover,
        ),
      ),
    );

Widget defaultText({required String text}) => Text(text,
    style: TextStyle(
      color: Colors.grey[500],
      fontSize: 16,
    ));
