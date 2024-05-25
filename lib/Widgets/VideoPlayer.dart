// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as YT;

import 'package:kids_learning_app/utils/admob.dart';
import 'package:kids_learning_app/utils/model.dart';

class VideoPlayer extends StatefulWidget {
  String? pageTitle;
  List<String> videoURLlist;
  VideoPlayer({
    Key? key,
    required this.pageTitle,
    required this.videoURLlist,
  }) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  // List<Numbermodel> alphabetvideolist = alphabetvideo1();
  // List<String> alphabetvideoURLlist = alphabetvideoURL();

  late final List<YT.YoutubePlayerController> _controllers =
      widget.videoURLlist.map((url) {
    String videoId = YT.YoutubePlayer.convertUrlToId(url)!;
    return YT.YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YT.YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }).toList();
  List<String> videoTitles = [];

  @override
  void initState() {
    super.initState();
    fetchVideoTitles();
  }

  Future<void> fetchVideoTitles() async {
    for (String url in widget.videoURLlist) {
      try {
        Response response = await Dio().get(url);
        String htmlContent = response.data;
        RegExp exp = RegExp(r'<meta property="og:title" content="(.+?)">');
        String title =
            exp.firstMatch(htmlContent)?.group(1) ?? 'Video Title Not Found';
        setState(() {
          videoTitles.add(title);
        });
      } catch (error) {
        print('Error fetching video title: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color(0xFFFEF7F0),
        elevation: 0,
        title: Center(
          child: Text(
            widget.pageTitle!,
            style: const TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: widget.videoURLlist.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / .73,
        ),
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                //border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(115, 160, 159, 159),
                    blurRadius: 2,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: YT.YoutubePlayer(
                      key: ObjectKey(_controllers[index]),
                      controller: _controllers[index],
                      actionsPadding: const EdgeInsets.only(left: 16.0),
                      bottomActions: [
                        YT.CurrentPosition(),
                        const SizedBox(width: 10.0),
                        YT.ProgressBar(isExpanded: true),
                        const SizedBox(width: 10.0),
                        YT.RemainingDuration(),
                        YT.FullScreenButton(),
                      ],
                    ),
                  ),

                  // Image.asset(
                  //   alphabetvideolist[index].image!,
                  //   fit: BoxFit.fill,
                  //   alignment: Alignment.topCenter,
                  //   height: 122,
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        videoTitles.length > index
                            ? videoTitles[index]
                            : 'Loading...',
                        style: const TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: "arlrdbd",
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
