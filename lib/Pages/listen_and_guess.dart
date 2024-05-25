import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kids_learning_app/Learning/Vegitable.dart';
import 'package:kids_learning_app/Widgets/GridWidget.dart';
import 'package:kids_learning_app/ListenGuessSongs/Alphabet.dart';
import 'package:kids_learning_app/ListenGuessSongs/Animal.dart';
import 'package:kids_learning_app/ListenGuessSongs/Brid.dart';
import 'package:kids_learning_app/ListenGuessSongs/Color.dart';
import 'package:kids_learning_app/ListenGuessSongs/Flower.dart';
import 'package:kids_learning_app/ListenGuessSongs/Fruit.dart';
import 'package:kids_learning_app/ListenGuessSongs/Month.dart';
import 'package:kids_learning_app/ListenGuessSongs/Number.dart';
import 'package:kids_learning_app/ListenGuessSongs/Shapes.dart';
import 'package:kids_learning_app/ListenGuessSongs/Vegitable.dart';
import 'package:kids_learning_app/utils/Utils.dart';
import 'package:kids_learning_app/utils/admob.dart';

class ListenGuess extends StatelessWidget {
  const ListenGuess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlutterTts flutterTts = FlutterTts();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFFEF7F0),
        elevation: 0,
        title: const Center(
          child: Text(
            'Listen And Guess',
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
                label: 'Alphabet Song',
                imagePath: 'assets/images/Alphabet.png',
                onTap: () {
                  flutterTts.speak('Apple');
                  Utils.jumpPage(context, const AlphabetSong());
                },
              ),
              GridItemWidget(
                label: 'Number Song',
                imagePath: 'assets/images/Numbers.png',
                onTap: () {
                  flutterTts.speak('Zero');
                  Utils.jumpPage(context, const NumberSong());
                },
              ),
              GridItemWidget(
                label: 'Color Song',
                imagePath: 'assets/images/Color.png',
                onTap: () {
                  flutterTts.speak('AQUA');
                  Utils.jumpPage(context, const ColorSong());
                },
              ),
              GridItemWidget(
                label: 'Shape Song',
                imagePath: 'assets/images/Shapes.png',
                onTap: () {
                  flutterTts.speak('ARRO');
                  Utils.jumpPage(context, const ShapesSong());
                },
              ),
              GridItemWidget(
                label: 'Animal Song',
                imagePath: 'assets/images/Animals.png',
                onTap: () {
                  flutterTts.speak('BEER');
                  Utils.jumpPage(context, const AnimalsSong());
                },
              ),
              GridItemWidget(
                label: 'Bird Song',
                imagePath: 'assets/images/Birds.png',
                onTap: () {
                  flutterTts.speak('ARARAT');
                  Utils.jumpPage(context, const BirdsSong());
                },
              ),
              GridItemWidget(
                label: 'Flower Song',
                imagePath: 'assets/images/Flowers.png',
                onTap: () {
                  flutterTts.speak('BLACK ROSE');
                  Utils.jumpPage(context, const FlowerSong());
                },
              ),
              GridItemWidget(
                label: 'Fruit Song',
                imagePath: 'assets/images/Fruit.png',
                onTap: () {
                  flutterTts.speak('APPLE');
                  Utils.jumpPage(context, const FruitSong());
                },
              ),
              GridItemWidget(
                label: 'Month Song',
                imagePath: 'assets/images/Month.png',
                onTap: () {
                  flutterTts.speak('JANUARY');
                  Utils.jumpPage(context, const MonthSong());
                },
              ),
              GridItemWidget(
                label: 'Vegitable Song',
                imagePath: 'assets/images/Vegitable.png',
                onTap: () {
                  flutterTts.speak('BELL PEPPER');
                  Utils.jumpPage(context, const VegitableSong());
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
