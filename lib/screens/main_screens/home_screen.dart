import '../buy_sell/buy_sell_screen.dart';
import '../car_repair/car_repair_screen.dart';
import '../car_service/car_service.dart';
import '../parking/parking_screen.dart';
import '../recovery/recovery_screen.dart';
import '../spare_parts/spare_screen.dart';
import '../../shared/components/defult_button.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            Icon(Icons.notifications_active_outlined),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: appPrimaryColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView(
              physics: BouncingScrollPhysics(),
              children: [
                homeItem(
                    image: AssetImage('assets/images/Untitled-6.png'),
                    text: 'CAE REPAIR',
                    function: () {
                      navigateTo(context, CarRepairScreen());
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
                    image: AssetImage('assets/lolo.png'),
                    text: 'PARKING',
                    function: () {
                      navigateTo(context, BarkingScreen());
                    }),
                homeItem(
                    image: AssetImage('assets/images/Untitled-2.png'),
                    text: 'BUY % SELL',
                    function: () {
                      navigateTo(context, BuySellScreen());
                    }),
                homeItem(
                    image: AssetImage('assets/Untitled-4.png'),
                    text: 'CAR SERVICES',
                    function: () {
                      navigateTo(context, CarServices());
                    }),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 40,
                crossAxisSpacing: 20,
              )),
        ));
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
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                    border: Border.all(color: appPrimaryColor, width: 4)),
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
