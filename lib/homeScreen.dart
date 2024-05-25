// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:kids_learning_app/Pages/LetsStartLearning.dart';
import 'package:kids_learning_app/utils/admob.dart';

import 'Pages/LookAndChooes.dart';
import 'Pages/VideoLearning.dart';
import 'Pages/listen_and_guess.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = "https://play.google.com/store/apps/details?id=com.example.kids";
  int? index = 0;
  AdmobHelper admobHelper = AdmobHelper();
  @override
  void initState() {
    super.initState();
    admobHelper.createInterad();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                'Exit App',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              content: const Text(
                'Do you want to exit an App?',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return OverflowBar(
      children: [
        WillPopScope(
          onWillPop: showExitPopup,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFFEF7F0),
              elevation: 0,
            ),
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.3,
                    child: Stack(
                      children: [
                        Container(
                            height: size.height * 0.3 - 27,
                            decoration: const BoxDecoration(
                                color: Color(0xFFFEF7F0),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(36),
                                    bottomRight: Radius.circular(36))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/sun.png"),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Good",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: "arlrdbd",
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Morning!",
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: "arlrdbd",
                                            color: Color(0xFFF19335),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 15,
                        children: [
                          ImageContainer(
                            image: "assets/images/number.png",
                            title: 'Lets Start Learning',
                            bgColor: const Color(0xFFE4F2E6),
                            onTap: () {
                              admobHelper.showInterad();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LetsStartLearning()));
                            },
                          ),
                          ImageContainer(
                            image: "assets/images/video.png",
                            title: 'Video Learning',
                            txtcolor: const Color(0xFFEC9E4E),
                            bgColor: const Color(0xFFFFF9F4),
                            onTap: () {
                              admobHelper.showInterad();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VideoLearning()));
                            },
                          ),
                          ImageContainer(
                            image: "assets/images/apple.png",
                            title: 'Look And Choose',
                            txtcolor: const Color(0xFFF2CC2B),
                            bgColor: const Color(0xFFFEF9E4),
                            onTap: () {
                              admobHelper.showInterad();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LookAndChooes()));
                            },
                          ),
                          ImageContainer(
                            image: "assets/images/lione.png",
                            title: 'Listen and Guess',
                            txtcolor: const Color(0xFF8770E4),
                            bgColor: const Color(0xFFEBE8FD),
                            onTap: () {
                              admobHelper.showInterad();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ListenGuess()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ImageContainer extends StatelessWidget {
  String? image;
  String? title;
  Color? txtcolor;
  Color? bgColor;
  void Function()? onTap;
  ImageContainer({
    Key? key,
    required this.image,
    required this.title,
    this.txtcolor = const Color(0xFF6DB072),
    this.bgColor = const Color(0xFF6DB072),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image!,
              height: 90,
            ),
            Text(
              title!,
              style: TextStyle(
                fontFamily: "arlrdbd",
                color: txtcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
