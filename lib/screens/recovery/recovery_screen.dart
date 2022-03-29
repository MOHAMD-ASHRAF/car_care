import '../../shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RecoveryScreen extends StatelessWidget {
 // const RecoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(backgroundColor: appPrimaryColor)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.70,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) => itemCard(),
        ),
      ),
    );
  }
}

Widget itemCard() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            // width: 160,
            // height: 190,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: appPrimaryColor, width: 4),
            ),
            child: Image(image: AssetImage('assets/images/lolo.png')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text('first',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        )
      ],
    );

