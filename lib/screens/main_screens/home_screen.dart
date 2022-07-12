import 'package:car_care/screens/car_repair/type_of_repair.dart';
import 'package:carousel_slider/carousel_slider.dart';
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

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final urlImage= [
    'https://c.files.bbci.co.uk/118A0/production/_118604817__116721094_mustang.jpg',
    'https://images.pexels.com/photos/3729464/pexels-photo-3729464.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://techcrunch.com/wp-content/uploads/2019/07/2019-bmw-i8-1.jpg?w=730&crop=1',
    'https://www.autocar.co.uk/sites/autocar.co.uk/files/images/car-reviews/first-drives/legacy/1_rangerover_tracking.jpg',
    'https://stimg.cardekho.com/images/carexteriorimages/630x420/Lamborghini/Urus/4418/Lamborghini-Urus-V8/1621927166506/front-left-side-47.jpg?impolicy=resize&imwidth=480',
  ];

  var boardController = PageController();

  int currentIndex = 0;

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
          MaterialButton(
            minWidth: 10,
            height: 10,
            onPressed: (){
              navigateTo(context, ProfileScreen());
            },
            child:  Icon(Icons.settings,color: Colors.white,size: 30,),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7)),
            gradient: LinearGradient(
              colors: [appPrimaryColor,secondColor],
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: boardController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
                },
              ),
              items: urlImage.map(
                    (item) => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    margin: EdgeInsets.only(
                      top: 15.0,
                      bottom: 15,
                    ),
                    elevation: 6.0,
                    shadowColor: appPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: urlImage.map((urlOfItem) {
                int index = urlImage.indexOf(urlOfItem);
                return Container(
                  width: 20.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex   == index
                        ? Color.fromRGBO(0, 0, 0, 0.8)
                        : Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                );
              }).toList(),),
            SizedBox(height:  10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    homeItem(
                        image: AssetImage('assets/images/repair.png'),
                        text: 'CAE REPAIR',
                        function: () {
                          navigateTo(context,TypeOfRepair());
                        }),
                    homeItem(
                        image: AssetImage('assets/images/recovery.png'),
                        text: 'RECOVERY',
                        function: () {
                          navigateTo(context, RecoveryScreen());
                        }),
                    homeItem(
                        image: AssetImage('assets/images/spare.png'),
                        text: 'SPARE PARTS',
                        function: () {
                          navigateTo(context, SpareScreen());
                        }),
                    homeItem(
                        image: AssetImage('assets/images/parking.png'),
                        text: 'PARKING',
                        function: () {
                          navigateTo(context, Home());
                        }),
                    homeItem(
                        image: AssetImage('assets/images/sell.png'),
                        text: 'BUY % SELL',
                        function: () {
                          navigateTo(context, BuySell());
                        }),
                    homeItem(
                        image: AssetImage('assets/images/car service.png'),
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
      ),
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
                    border: Border.all(color: appPrimaryColor, width: 3)
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



Widget buildImage(String urlImage , int index) => Container(
  margin: EdgeInsets.symmetric(horizontal: 24),
  child: Image.network(urlImage,fit: BoxFit.cover,),
    decoration: BoxDecoration(
      color: Colors.grey,
    borderRadius: BorderRadius.circular(200),
 ),
);