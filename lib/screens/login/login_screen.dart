
import 'package:car_care/shared/components/defult_button.dart';
import 'package:car_care/shared/components/form_field.dart';
import 'package:car_care/screens/main_screens/home_screen.dart';
import 'package:car_care/screens/sing_up/sing_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController =TextEditingController();
  bool? checked =false;
  bool isHide =true;
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                    child: Text('Welcome',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Text('Back!',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 150,),
                  Container(
                    width: double.infinity,
                    height: 150,
                    child: Image(
                        image: AssetImage('assets/logo.png'),fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text('Email' , style:
                        TextStyle(color: Colors.grey[500]
                          ,fontSize: 16,
                        )
                        ),
                        SizedBox(height: 5,),
                        defaultField(
                          emailController: emailController,
                          width: double.infinity,
                          typeOfInput: TextInputType.emailAddress,
                        ),
                        SizedBox(height:10),
                        Text('Password' , style:
                        TextStyle(color: Colors.grey[500]
                          ,fontSize: 16,
                        )
                        ),
                        SizedBox(height: 5,),
                        defaultField(
                          obscureText:isHide,
                          emailController:  passwordController,
                          width: double.infinity,
                          typeOfInput: TextInputType.emailAddress,
                          suffix: GestureDetector(
                            onTap: (){
                              setState(() {
                                 isHide =!isHide;
                              });
                            },
                            child: isHide ? Icon(Icons.visibility_off) : Icon(Icons.visibility , color: Colors.green) ,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Checkbox(value: checked,
                                onChanged: (value){
                                  setState(() {
                                    checked = value;
                                  });
                                }),
                            Text('Remember Me' , style:
                            TextStyle(color: Colors.grey[500]
                              ,fontSize: 16,
                            )
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                          Center(
                            child: defaultButton(
                              width: 150,
                              color: Colors.black,
                              colorText: Colors.white,
                              text: 'Log in',
                              function: (){
                                navigateTo(context, HomeScreen());
                              }
                            ),
                          ),
                        Row(
                          children: [
                            TextButton(onPressed: (){
                              navigateTo(context, SingUpScreen());
                            },
                                child: Text('Sing UP', style: TextStyle(color: Colors.black),
                                )
                            ),
                            Spacer(),
                            TextButton(onPressed: (){},
                                child: Text('Forget Password?',style: TextStyle(color: Colors.black,),)
                            ),
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
  void changePasswordView() {
   // isHide == true ? isHide == false : isHide == true;
   // isHide =!isHide!;
    setState(() {
     // isHide =!isHide!;
    });
  }
}


Widget backGround()=>Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/3.png'),
      fit: BoxFit.cover,
    ),
  ),
);

Widget defaultText({required String text})=> Text(
    text, style:
TextStyle(color: Colors.grey[500]
  ,fontSize: 16,
)
);

