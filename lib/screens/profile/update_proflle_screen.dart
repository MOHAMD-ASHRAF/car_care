import 'package:car_care/cubit/app_state.dart';
import 'package:car_care/cubit/cubit.dart';
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
      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  if(state is UpdateUserDataLoadingState)
                  LinearProgressIndicator(),
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
                  SizedBox(height: 30,),
                  TextFormField(
                    controller:  phoneController,
                    textCapitalization: TextCapitalization.words,
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
                  SizedBox(height: 30,),
                  MaterialButton(
                    color: Colors.red,
                    onPressed: (){
                       if(formKey.currentState!.validate()){
                         AppCubit.get(context).updateUserData(name: nameController.text, phone: phoneController.text);
                       }
                    },
                    child: Text('update')
                    ,
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
