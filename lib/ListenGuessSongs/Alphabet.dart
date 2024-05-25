import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids_learning_app/utils/model.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class AlphabetSong extends StatefulWidget {
  const AlphabetSong({super.key});

  @override
  State<AlphabetSong> createState() => _AlphabetSongState();
}

List<Numbermodel> abcsongs1 = abcsongs();

class _AlphabetSongState extends State<AlphabetSong> {
  final FlutterTts flutterTts = FlutterTts();
  bool isPressed = false;
  Color istrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Colors.blue;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController(initialPage: 0);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: const Color(0xFFFEF7F0),
            title: const Center(
              child: Text(
                'Alphabet',
                style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
              ),
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (page) {
                    isPressed = false;
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: alphasongs2.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        Image.asset("assets/images/volume.png"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            abcsongs1[index].Text!,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontFamily: "arlrdbd"),
                          ),
                        ),
                        const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        Expanded(
                          child: GridView.count(
                            padding: const EdgeInsets.all(50),
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 15,
                            crossAxisCount: 2,
                            physics: const NeverScrollableScrollPhysics(),
                            primary: false,
                            children: [
                              for (int i = 0;
                                  i < alphasongs2[index].answer.length;
                                  i++)
                                MaterialButton(
                                  shape: BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  elevation: 5.0,
                                  height: 10,
                                  minWidth: double.infinity,
                                  color: isPressed
                                      ? alphasongs2[index]
                                              .answer
                                              .entries
                                              .toList()[i]
                                              .value
                                          ? istrue
                                          : isWrong
                                      : Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  onPressed: isPressed
                                      ? () {}
                                      : () {
                                          if (alphasongs2[index]
                                              .answer
                                              .entries
                                              .toList()[i]
                                              .value) {
                                            setState(() {
                                              isPressed = true;
                                            });
                                            score += 1;
                                            print(score);
                                            MotionToast.success(
                                              borderRadius: 5,
                                              animationDuration:
                                                  const Duration(seconds: 3),
                                              title: const Text(
                                                "Your Answer is Right",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              description: const Text(''),
                                              iconType: IconType.cupertino,
                                            ).show(context);
                                          } else {
                                            setState(() {
                                              isPressed = true;
                                            });
                                            MotionToast.error(
                                              borderRadius: 5,
                                              animationDuration:
                                                  const Duration(seconds: 3),
                                              title: const Text(
                                                "Your Answer is Wrong",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              description: const Text(''),
                                              iconType: IconType.cupertino,
                                            ).show(context);
                                          }
                                        },
                                  child: Image(
                                    image: AssetImage(alphasongs2[index]
                                        .answer
                                        .keys
                                        .toList()[i]),
                                    height: 100,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () =>
                                      flutterTts.speak(abcsongs1[index].Text!),
                                  child: Image.asset(
                                      'assets/images/11MaskGroup3.png')),
                              Center(
                                  child: ListTile(
                                trailing: InkWell(
                                  onTap: isPressed
                                      ? index + 1 == questions.length
                                          ? () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ResultSrceen(score)));
                                            }
                                          : () {
                                              _controller.nextPage(
                                                  duration: const Duration(
                                                      microseconds: 500),
                                                  curve: Curves.linear);
                                              flutterTts.speak(
                                                  abcsongs1[index + 1].Text!);
                                            }
                                      : null,
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/images/11MaskGroup5.png'),
                                  ),
                                ),
                                leading: InkWell(
                                  onTap: isPressed
                                      ? index - 1 == questions.length
                                          ? () {}
                                          : () {
                                              _controller.previousPage(
                                                  duration: const Duration(
                                                      microseconds: 500),
                                                  curve: Curves.linear);
                                              flutterTts.speak(
                                                  abcsongs1[index - 1].Text!);
                                            }
                                      : null,
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/images/11MaskGroup4.png'),
                                  ),
                                ),
                              )),
                            ]),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class ResultSrceen extends StatefulWidget {
  final int score;
  const ResultSrceen(this.score, {super.key});
  @override
  _ResultSrceenState createState() => _ResultSrceenState();
}

class _ResultSrceenState extends State<ResultSrceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
              child: Text(
            "Congratulation",
            style: TextStyle(
                color: Colors.redAccent, fontFamily: "arlrdbd", fontSize: 38.0),
          )),
          const Center(
              child: Text(
            "Your Score is:",
            style: TextStyle(
                color: Colors.redAccent,
                fontFamily: "arlrdbd",
                fontSize: 25.0,
                fontWeight: FontWeight.w500),
          )),
          const SizedBox(
            height: 50.0,
          ),
          Center(
              child: Text(
            "${widget.score}",
            style: const TextStyle(
                color: Colors.redAccent, fontFamily: "arlrdbd", fontSize: 80.0),
          ))
        ],
      ),
    );
  }
}
