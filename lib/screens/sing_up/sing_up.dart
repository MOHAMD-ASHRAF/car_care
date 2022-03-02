import '../../shared/components/defult_button.dart';
import '../../shared/components/form_field.dart';
import '../login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingUpScreen extends StatefulWidget {
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var cityController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isHide = true;
  bool isHideConfirm = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Image(
                      width: 80,
                      height: 60,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/back buttom.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      'Create',
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
                      'Account',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultText(text: 'name'),
                        SizedBox(
                          height: 5,
                        ),
                        defaultField(
                          controller: nameController,
                          width: double.infinity,
                          typeOfInput: TextInputType.name,
                        ),
                        SizedBox(height: 10),
                        defaultText(text: 'email'),
                        SizedBox(
                          height: 5,
                        ),
                        defaultField(
                          controller: emailController,
                          width: double.infinity,
                          typeOfInput: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 10),
                        defaultText(text: 'Phone Number'),
                        SizedBox(
                          height: 5,
                        ),
                        defaultField(
                          controller: phoneController,
                          width: double.infinity,
                          typeOfInput: TextInputType.number,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultText(text: 'City/Town'),
                        SizedBox(
                          height: 5,
                        ),
                        defaultField(
                          controller: cityController,
                          width: double.infinity,
                          typeOfInput: TextInputType.text,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultText(text: 'Password'),
                                SizedBox(
                                  height: 5,
                                ),
                                defaultField(
                                  obscureText: isHide,
                                  controller: passwordController,
                                  width: 150,
                                  typeOfInput: TextInputType.number,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultText(text: 'Confirm Password'),
                                SizedBox(
                                  height: 5,
                                ),
                                defaultField(
                                  obscureText: isHideConfirm,
                                  controller: confirmPasswordController,
                                  width: 150,
                                  typeOfInput: TextInputType.number,
                                ),
                              ],
                            ),
                          ],
                        ),
                        defaultText(text: 'Account Type'),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: defaultButton(
                            width: 150,
                            color: Colors.red,
                            colorText: Colors.white,
                            text: 'Sin up',
                            function: () {},
                          ),
                        ),
                        Divider(
                          height: 20,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account ?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  navigateTo(context, LoginScreen());
                                },
                                child: Text(
                                  'LOG IN',
                                  style: TextStyle(color: Colors.black),
                                ))
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
