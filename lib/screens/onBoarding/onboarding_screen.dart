
import 'package:car_care/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../network/local/cache_helper.dart';
import '../../shared/components/form_field.dart';
import '../../shared/constants/app_colors.dart';
import '../login/login_screen.dart';
import '../user_or_worker/user_or_worker_screen.dart';

class BoardingModel{
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
});

}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/welcome.png',
        title: 'Welcome ',
        body: 'Welcome to our services in car care'
    ),
    BoardingModel(
        image: 'assets/images/second.png',
        title: 'our services',
        body: 'Our services include everything related to car services and maintenance'
    ),
    BoardingModel(
        image: 'assets/images/last.png',
        title: 'Register now',
        body: 'Register now to get all the features and services'
    ),
  ];

  bool isLast = false;

  void submit(){
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value){
      if(value){
        navigateAndFinish(
            context,
            UserOrWorkerScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         elevation: 0,
          backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: (){
                submit();
              } ,
              child: Text('skip',style: TextStyle(color: appPrimaryColor),),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index){
                  if(index == boarding.length - 1){
                    setState(() {
                      isLast =true;
                    });
                  }else{
                    setState(() {
                      isLast =false;
                    });
                  }
                },
                itemBuilder: (context,index)=> buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 50,),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      activeDotColor: appPrimaryColor,
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      expansionFactor: 3,
                      dotWidth: 10,
                      spacing: 7,
                    ),
                    count: boarding.length
                ),
                Spacer(),
                FloatingActionButton(
                backgroundColor: appPrimaryColor,
                 onPressed: (){
                   if(isLast){
                     submit();
                   }else{
                     boardController.nextPage(
                       duration: Duration(
                         milliseconds: 750,
                       ),
                       curve: Curves.fastLinearToSlowEaseIn,);
                   }
                 },
                 child: Icon(Icons.arrow_forward_ios),)
              ],
            ),
          ],
        ),
      ),
    );

  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      Center(
        child: Text(
          '${model.title}',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      SizedBox(height: 20,),
      Center(
        child: Text(
          '${model.body}',style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    ],
  );
}