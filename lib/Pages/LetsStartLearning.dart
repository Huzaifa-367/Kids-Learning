import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kids_learning_app/Learning/Alphabet.dart';
import 'package:kids_learning_app/Learning/Animals.dart';
import 'package:kids_learning_app/Learning/Brids.dart';
import 'package:kids_learning_app/Learning/Colors.dart';
import 'package:kids_learning_app/Learning/Flowers.dart';
import 'package:kids_learning_app/Learning/Fruit.dart';
import 'package:kids_learning_app/Learning/Month.dart';
import 'package:kids_learning_app/Learning/Number.dart';
import 'package:kids_learning_app/Learning/Shapes.dart';
import 'package:kids_learning_app/Learning/Vegitable.dart';
import 'package:kids_learning_app/Widgets/GridWidget.dart';
import 'package:kids_learning_app/utils/Utils.dart';
import 'package:kids_learning_app/utils/admob.dart';

class LetsStartLearning extends StatelessWidget {
  const LetsStartLearning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        // backgroundColor: ,
        elevation: 0,
        title: const Center(
          child: Text(
            "PreSchool Kids Learning",
            style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: GridView.count(
            padding: const EdgeInsets.all(35),
            mainAxisSpacing: 15,
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            children: [
              GridItemWidget(
                label: 'Alphabet',
                imagePath: "assets/images/number.png",
                onTap: () {
                  Utils.jumpPage(context, const Alphabet());
                },
              ),
              GridItemWidget(
                label: 'Number ',
                imagePath: 'assets/images/Numbers.png',
                onTap: () {
                  Utils.jumpPage(context, const Numbers());
                },
              ),
              GridItemWidget(
                label: 'Color ',
                imagePath: 'assets/images/Color.png',
                onTap: () {
                  Utils.jumpPage(context, color());
                },
              ),
              GridItemWidget(
                label: 'Shape ',
                imagePath: 'assets/images/Shapes.png',
                onTap: () {
                  Utils.jumpPage(context, const Shapes());
                },
              ),
              GridItemWidget(
                label: 'Animal ',
                imagePath: 'assets/images/Animals.png',
                onTap: () {
                  Utils.jumpPage(context, const Animal());
                },
              ),
              GridItemWidget(
                label: 'Bird ',
                imagePath: 'assets/images/Birds.png',
                onTap: () {
                  Utils.jumpPage(context, const Brids());
                },
              ),
              GridItemWidget(
                label: 'Flower ',
                imagePath: 'assets/images/Flowers.png',
                onTap: () {
                  Utils.jumpPage(context, const Flower());
                },
              ),
              GridItemWidget(
                label: 'Fruit ',
                imagePath: 'assets/images/Fruit.png',
                onTap: () {
                  Utils.jumpPage(context, const Fruits());
                },
              ),
              GridItemWidget(
                label: 'Month ',
                imagePath: 'assets/images/Month.png',
                onTap: () {
                  Utils.jumpPage(context, Month());
                },
              ),
              GridItemWidget(
                label: 'Vegitable ',
                imagePath: 'assets/images/Vegitable.png',
                onTap: () {
                  Utils.jumpPage(context, const Vegitable());
                },
              ),

              // Add more grid items here...
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.width * 0.13,
        width: 25,
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
        ),
      ),
    );
  }
}
