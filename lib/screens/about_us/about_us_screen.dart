
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../shared/constants/app_colors.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Car Details'),
          backgroundColor: appPrimaryColor,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('rating = $rating'),
            RatingBar.builder(
              maxRating: 1,
              itemSize: 40,
              itemPadding: EdgeInsets.symmetric(horizontal: 5),
              itemBuilder: (context,_)=> Icon(Icons.star,color: Colors.amber,),
              updateOnDrag: true,
              onRatingUpdate: (rating) => setState(() {
                this.rating = rating;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
