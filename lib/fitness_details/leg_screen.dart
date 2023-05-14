import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'daily_workout.dart';

class LegsScreen extends StatefulWidget {
  const LegsScreen({Key? key}) : super(key: key);

  @override
  State<LegsScreen> createState() => _LegsScreenState();
}

class _LegsScreenState extends State<LegsScreen> {
  final videoUrl = 'https://www.youtube.com/watch?v=2-TOX8RFhr8';
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: false)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/training_images/bg.jpg'),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 15),
                 YoutubePlayer(
                     controller: _controller,
                 showVideoProgressIndicator: true,
                 )

                 /* Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      color: Colors.white12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: double.infinity,
                              color: Colors.black,
                              padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 7),
                              child: const Text(
                                'Instructions: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, color: Colors.white),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Perform each bodyweight move below for the indicated amount of time,'
                                ' then continue immediately on to the next as quickly as possible.'
                                ' Once you have completed all six exercises,'
                                ' repeat twice more for a total of three rounds.',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),*/

                ],
              ),
            ),
          ),
        ));
  }
}


