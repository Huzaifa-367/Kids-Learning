import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kids_learning_app/Widgets/GridWidget.dart';
import 'package:kids_learning_app/Quiz/ABCQuize.dart';
import 'package:kids_learning_app/Quiz/AnimalQuize.dart';
import 'package:kids_learning_app/Quiz/BirdQuize.dart';
import 'package:kids_learning_app/Quiz/ColorQuiz.dart';
import 'package:kids_learning_app/Quiz/FlowerQuize.dart';
import 'package:kids_learning_app/Quiz/FruitQuize.dart';
import 'package:kids_learning_app/Quiz/MonthQuize.dart';
import 'package:kids_learning_app/Quiz/NumberQuiz.dart';
import 'package:kids_learning_app/Quiz/ShapeQuiz.dart';
import 'package:kids_learning_app/Quiz/VegitableQuiz.dart';
import 'package:kids_learning_app/utils/admob.dart';

class LookAndChooes extends StatelessWidget {
  const LookAndChooes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFFEF7F0),
        elevation: 0,
        title: const Center(
          child: Text(
            'Look And Choose',
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
                label: 'Alphabet quiz',
                imagePath: 'assets/images/Alphabet.png',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ABCQuiz()));
                },
              ),
              GridItemWidget(
                label: 'Number quiz',
                imagePath: 'assets/images/Numbers.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Numberquiz()));
                },
              ),
              GridItemWidget(
                label: 'Color quiz',
                imagePath: 'assets/images/Color.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Colorquiz()));
                },
              ),
              GridItemWidget(
                label: 'Shape quiz',
                imagePath: 'assets/images/Shapes.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Shapequiz()));
                },
              ),
              GridItemWidget(
                label: 'Animal quiz',
                imagePath: 'assets/images/Animals.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnimalQuiz()));
                },
              ),
              GridItemWidget(
                label: 'Bird quiz',
                imagePath: 'assets/images/Birds.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Birdquiz()));
                },
              ),
              GridItemWidget(
                label: 'Flower quiz',
                imagePath: 'assets/images/Flowers.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Flowerquiz()));
                },
              ),
              GridItemWidget(
                label: 'Fruit quiz',
                imagePath: 'assets/images/Fruit.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Fruitquiz()));
                },
              ),
              GridItemWidget(
                label: 'Month quiz',
                imagePath: 'assets/images/Month.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Monthquiz()));
                },
              ),
              GridItemWidget(
                label: 'Vegitable quiz',
                imagePath: 'assets/images/Vegitable.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Vegitablequiz()));
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
