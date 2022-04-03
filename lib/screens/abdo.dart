// import 'package:car_care/screens/login/login_screen.dart';
// import 'package:car_care/screens/user_or_worker/user_or_worker_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../cubit/cubit.dart';
// import '../shared/components/default_button.dart';
//
// class Abdo extends StatefulWidget {
//
//
//   @override
//   State<Abdo> createState() => _AbdoState();
// }
//
// class _AbdoState extends State<Abdo> {
//
//    AppCubit?  cubit;
//   @override
//   void initState() {
//     cubit = AppCubit.get(context);
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: FlatButton(
//             onPressed: (){
//               AppCubit.get(context).userModel.user!.sId;
//               navigateTo(context , LoginScreen());
//             }, child: Text('goooo'),
//           ),
//         ),
//       )
//     );
//   }
// }
//
//
