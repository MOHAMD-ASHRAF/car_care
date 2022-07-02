import 'package:car_care/cubit/app_state.dart';
import 'package:car_care/cubit/cubit.dart';
import 'package:car_care/shared/components/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/constants/app_colors.dart';

class UpdateProfileScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context,state){
        if(state is UpdateUserDataLoadingState)
          showToast(
            text: 'success update',
            state: ToastStates.SUCCESS,
          );
      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                   TextFormField(
                    controller:  nameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(hintText:  'name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'input new name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(height: 50,),
                  TextFormField(
                    controller:  phoneController,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText:  'phone'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'input new phone';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(height: 40,),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: MaterialButton(
                      color: appPrimaryColor,
                      onPressed: (){
                        if(formKey.currentState!.validate()){

                          AppCubit.get(context).updateUserData(name: nameController.text, phone: phoneController.text);
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('update',style: TextStyle(color: Colors.white,fontSize: 20),)
                      ,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}