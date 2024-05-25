import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kids_learning_app/Widgets/GridWidget.dart';
import 'package:kids_learning_app/Widgets/VideoPlayer.dart';
import 'package:kids_learning_app/utils/Utils.dart';
import 'package:kids_learning_app/utils/admob.dart';
import 'package:kids_learning_app/utils/model.dart';

class VideoLearning extends StatefulWidget {
  const VideoLearning({Key? key}) : super(key: key);

  @override
  State<VideoLearning> createState() => _VideoLearningState();
}

class _VideoLearningState extends State<VideoLearning> {
  @override
  Widget build(BuildContext context) {
    AdmobHelper admobHelper = AdmobHelper();

    @override
    void initState() {
      super.initState();
      admobHelper.createInterad();
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFFEF7F0),
        elevation: 0,
        title: const Center(
          child: Text(
            'Video Learning',
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
                label: 'Alphabet Video',
                imagePath: 'assets/images/Alphabet.png',
                onTap: () {
                  admobHelper.showInterad();
                  Utils.jumpPage(
                    context,
                    VideoPlayer(
                      pageTitle: 'ABC Video Songs',
                      videoURLlist: alphabetvideoURL(),
                    ),
                  );
                },
              ),
              GridItemWidget(
                label: 'Number Video',
                imagePath: 'assets/images/Numbers.png',
                onTap: () {
                  admobHelper.showInterad();
                  Utils.jumpPage(
                    context,
                    VideoPlayer(
                      pageTitle: 'Number Video Songs',
                      videoURLlist: numbervideoURL(),
                    ),
                  );
                },
              ),
              GridItemWidget(
                label: 'Color Video',
                imagePath: 'assets/images/Color.png',
                onTap: () {
                  admobHelper.showInterad();
                  Utils.jumpPage(
                    context,
                    VideoPlayer(
                      pageTitle: 'Colors Video Songs',
                      videoURLlist: colorvideoURL(),
                    ),
                  );
                },
              ),
              GridItemWidget(
                label: 'Shape Video',
                imagePath: 'assets/images/Shapes.png',
                onTap: () {
                  admobHelper.showInterad();
                  Utils.jumpPage(
                    context,
                    VideoPlayer(
                      pageTitle: 'Shape Video Songs',
                      videoURLlist: shapevideoURL(),
                    ),
                  );
                },
              ),
              GridItemWidget(
                label: 'Animal Video',
                imagePath: 'assets/images/Animals.png',
                onTap: () {
                  admobHelper.showInterad();
                  Utils.jumpPage(
                    context,
                    VideoPlayer(
                      pageTitle: 'Animal Video Songs',
                      videoURLlist: animalvideoURL(),
                    ),
                  );
                },
              ),
              GridItemWidget(
                label: 'Bird Video',
                imagePath: 'assets/images/Birds.png',
                onTap: () {
                  admobHelper.showInterad();
                  Utils.jumpPage(
                    context,
                    VideoPlayer(
                      pageTitle: 'Birds Video Songs',
                      videoURLlist: bridvideoURL(),
                    ),
                  );
                },
              ),
              GridItemWidget(
                label: 'Flower Video',
                imagePath: 'assets/images/Flowers.png',
                onTap: () {
                  admobHelper.showInterad();
                  Utils.jumpPage(
                    context,
                    VideoPlayer(
                      pageTitle: 'Flower Video Songs',
                      videoURLlist: flowervideoURL(),
                    ),
                  );
                },
              ),
              GridItemWidget(
                label: 'Fruit Video',
                imagePath: 'assets/images/Fruit.png',
                onTap: () {
                  admobHelper.showInterad();
                  Utils.jumpPage(
                    context,
                    VideoPlayer(
                      pageTitle: 'Fruit Video Songs',
                      videoURLlist: fruitvideoURL(),
                    ),
                  );
                },
              ),
              GridItemWidget(
                label: 'Month Video',
                imagePath: 'assets/images/Month.png',
                onTap: () {
                  admobHelper.showInterad();
                  Utils.jumpPage(
                    context,
                    VideoPlayer(
                      pageTitle: 'Month Video Songs',
                      videoURLlist: monthvideoURL(),
                    ),
                  );
                },
              ),
              GridItemWidget(
                label: 'Vegitable Video',
                imagePath: 'assets/images/Vegitable.png',
                onTap: () {
                  admobHelper.showInterad();
                  Utils.jumpPage(
                    context,
                    VideoPlayer(
                      pageTitle: 'Vegitable Video Songs',
                      videoURLlist: vegitablevideoURL(),
                    ),
                  );
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
