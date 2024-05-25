import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kids_learning_app/utils/admob.dart';
import 'package:kids_learning_app/utils/model.dart';

class AlphaSound extends StatefulWidget {
  int index1;

  AlphaSound(this.index1, {super.key});
  @override
  State<AlphaSound> createState() => _AlphaSoundState();
}

List<Numbermodel> kidslist = KidsList1();

class _AlphaSoundState extends State<AlphaSound> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    Future _speak() async {
      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(10.0);
      await flutterTts.setVolume(10.0);
      print(await flutterTts.getVoices);
      int count = widget.index1;

      await flutterTts.speak(kidslist[count].Text!);
    }

    final _controller = PageController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.orange[50],
        elevation: 0,
        title: const Center(
          child: Text(
            'Alphabet',
            style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 600,
        width: MediaQuery.of(context).size.height * 1000,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/images/Union 12.png")),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Flexible(
                  child: Card(
                    margin: const EdgeInsets.all(20),
                    elevation: 5,
                    shadowColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: PageView.builder(
                      controller: _controller,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: kidslist.length,
                      itemBuilder: (BuildContext context, int index1) {
                        return Center(
                          child: Image.asset(
                            kidslist[widget.index1].image!,
                            alignment: Alignment.topCenter,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () => _speak(),
                          child: Image.asset(
                            'assets/images/11MaskGroup3.png',
                            alignment: Alignment.topCenter,
                          )),
                      Align(
                        heightFactor: 0.5,
                        child: Center(
                          child: ListTile(
                            trailing: InkWell(
                              onTap: () {
                                if (widget.index1 >= 0 && widget.index1 < 25) {
                                  print(widget.index1);
                                  setState(() {
                                    widget.index1++;
                                  });
                                }
                                _speak();
                              },
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/11MaskGroup5.png'),
                              ),
                            ),
                            leading: InkWell(
                              onTap: () {
                                if (widget.index1 > 0 && widget.index1 <= 25) {
                                  setState(() {
                                    widget.index1--;
                                  });
                                }
                                _speak();
                              },
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/11MaskGroup4.png'),
                              ),
                            ),
                          ),
                        ),
                      )
                    ])
              ])),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.width * 0.13,
          width: 25,
          child: AdWidget(
            ad: AdmobHelper.getBannerAd()..load(),
          ),
        ),
      ),
    );
  }
}
