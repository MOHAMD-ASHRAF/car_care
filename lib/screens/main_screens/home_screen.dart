import 'package:car_care/cubit/app_state.dart';
import 'package:car_care/cubit/cubit.dart';
import 'package:car_care/screens/car_repair/type_of_repair.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/default_button.dart';
import '../buy_sell/buy_sell_screen.dart';
import '../car_service/car_service.dart';
import '../parking/parking_screen.dart';
import '../profile/profile_screen.dart';
import '../recovery/recovery_screen.dart';
import '../spare_parts/spare_screen.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
         listener: (context, state){},
        builder: (context,state){
          var profileImage  = AppCubit.get(context).profileImage;
          return Scaffold(
              drawer: DrawerWidget(),
              appBar: AppBar(
                toolbarHeight: 70,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'Home Screen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                actions: [
                  MaterialButton(
                    minWidth: 10,
                    height: 10,
                    onPressed: (){
                      navigateTo(context, ProfileScreen());
                    },
                    child: CircleAvatar(
                      backgroundImage: profileImage == null ? NetworkImage(
                          'https://www.seekpng.com/png/detail/46-462910_person-icon-black-avatar-png.png'
                      ) : FileImage(profileImage) as ImageProvider ,
                    ),
                  )
                ],
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7)),
                     gradient: LinearGradient(
                    colors: [appPrimaryColor,Colors.red],
                    begin: Alignment.bottomRight,
                    end: Alignment.bottomLeft,
                  ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    CarouselSlider(
                      items: [
                        Image(image: NetworkImage('https://bloomerang.co/wp-content/uploads/2016/10/bmw-header.png'),fit: BoxFit.cover),
                        Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Fkwuze97T8a6bsYiG-KMdL6bplKciuk12g&usqp=CAU'),fit: BoxFit.cover),
                        Image(image: NetworkImage('https://www.izmostock.com/wp-content/uploads/2018/04/izmostock_MainBanner_05.jpg'),fit: BoxFit.cover),
                      ],
                        options: CarouselOptions(
                          height: 150,
                          initialPage: 0,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds:  3),
                          autoPlayAnimationDuration: Duration(seconds: 3),
                          scrollDirection: Axis.horizontal,
                        ),
                    ),
                    SizedBox(height:  10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView(
                        physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            homeItem(
                                image: AssetImage('assets/images/Untitled-6.png'),
                                text: 'CAE REPAIR',
                                function: () {
                                  navigateTo(context,TypeOfRepair());
                                }),
                            homeItem(
                                image: AssetImage('assets/images/Untitled-7.png'),
                                text: 'RECOVERY',
                                function: () {
                                  navigateTo(context, RecoveryScreen());
                                }),
                            homeItem(
                                image: AssetImage('assets/images/Untitled-5.png'),
                                text: 'SPARE PARTS',
                                function: () {
                                  navigateTo(context, SpareScreen());
                                }),
                            homeItem(
                                image: AssetImage('assets/images/lolo.png'),
                                text: 'PARKING',
                                function: () {
                                  navigateTo(context, BarkingScreen());
                                }),
                            homeItem(
                                image: AssetImage('assets/images/Untitled-2.png'),
                                text: 'BUY % SELL',
                                function: () {
                                }),
                            homeItem(
                                image: AssetImage('assets/images/Untitled-4.png'),
                                text: 'CAR SERVICES',
                                function: () {
                                  navigateTo(context, CarServices());
                                }),
                          ],
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 20,
                          )
                      ),
                    ),
                  ],
                ),
              )
          );
        },
    );
  }

  Widget homeItem(
          {required AssetImage image,
          required String text,
          GestureTapCallback? function}) =>
      InkWell(
        onTap: function,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                    border: Border.all(color: appPrimaryColor, width: 4)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image(
                    image: image,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          ],
        ),
      );
}
