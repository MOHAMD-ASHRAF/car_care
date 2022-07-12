import 'package:car_care/cubit/app_state.dart';
import 'package:car_care/cubit/cubit.dart';
import 'package:car_care/screens/worker/worker_login_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../network/local/cache_helper.dart';
import '../../shared/components/default_button.dart';
import '../../shared/components/form_field.dart';
import '../../shared/components/toast.dart';
import '../main_screens/home_screen.dart';
import '../sing_up/sing_up._screen.dart';

class WorkerRegisterScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var specializedController = TextEditingController();
  bool isHide = true;
  bool isHideConfirm = true;
  List item =['motor','electronic','another'];
  String? selected= 'another';
  @override
  Widget build(BuildContext context) {

   // final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocConsumer<AppCubit,AppState>(
      listener: (context, state) {
        if (state is WorkerRegisterSuccessState) {
          if (state.workerRegisterModel.status == 'success') {
            CacheHelper.saveData(key: 'token', value: state.workerRegisterModel.token).then((value) {
              navigateAndFinish(context, HomeScreen());
            });
            showToast(
              text: state.workerRegisterModel.message!,
              state: ToastStates.SUCCESS,
            );
            navigateAndFinish(context, HomeScreen());
          } else {
            print('${state.workerRegisterModel.message}');
            showToast(
              text: state.workerRegisterModel.message.toString(),
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        return GestureDetector(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  backGround(),
                  SingleChildScrollView(
                   // reverse: false,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 16,
                                )),
                            SizedBox(height: 5),
                            defaultField(
                                controller: emailController,
                                typeOfInput: TextInputType.emailAddress,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter correct email';
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Name',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 16,
                                )),
                            SizedBox(height: 5),
                            defaultField(
                                controller: nameController,
                                typeOfInput: TextInputType.name,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter correct name';
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Phone Number',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 16,
                                )),
                            SizedBox(height: 5),
                            defaultField(
                                controller: phoneController,
                                typeOfInput: TextInputType.phone,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter correct phone number';
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Location',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 16,
                                )),
                            SizedBox(height: 5),
                            defaultField(
                                controller: locationController,
                                typeOfInput: TextInputType.name,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter correct Location';
                                  }
                                  return null;
                                }),
                            SizedBox(height: 5),
                            Text('specialty',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 17,
                                )),
                            SizedBox(height: 5),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(width: 1,)
                                )
                              ),
                              value:  selected,
                              items: item
                                    .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(item,style: TextStyle(fontSize: 15),)
                                )).toList(),
                                onChanged: (item) => selected = item.toString(),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                          label: Text('password'),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(16),
                                          )),
                                        validator:  (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter correct password';
                                          }
                                          return null;
                                        }
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: confirmPasswordController,
                                      decoration: InputDecoration(
                                          label: Text('confirm password'),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(16),
                                          )),
                                        validator:  (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter correct password';
                                          }
                                          return null;
                                        }
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Spacer(),
                            Center(
                              child: ConditionalBuilder(
                                condition: state is! WorkerRegisterLoadingState,
                                builder: (context) => defaultButton(
                                    width: 150,
                                    color: Colors.black,
                                    colorText: Colors.white,
                                    text: 'Register',
                                    function: () {
                                      if (formKey.currentState!.validate()) {
                                        AppCubit.get(context).workerRegister(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          confirmPassword: confirmPasswordController.text,
                                          phone: phoneController.text,
                                          name: nameController.text,
                                          location: locationController.text,
                                          specialized: selected!,
                                        );
                                      } //navigateTo(context, HomeScreen());
                                    }),
                                fallback: (context) => Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.red)),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                                Center(
                                    child: Text(
                                      'or',
                                      style: TextStyle(fontSize: 20),
                                    )),
                                Expanded(
                                  child: Container(
                                    height: 2,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account ?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 70,
                                  height: 30,
                                  child: TextButton(
                                      onPressed: () {
                                        navigateTo(context, WorkerLoginScreen());
                                      },
                                      child: Text(
                                        'LOG IN',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


Widget defaultText({required String text}) => Text(text,
    style: TextStyle(
      color: Colors.grey[500],
      fontSize: 16,
    ));


Widget backGround() => Container(
  width: double.infinity,
  height: 300,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/create.png'),
      fit: BoxFit.fill,
    ),
  ),
);
