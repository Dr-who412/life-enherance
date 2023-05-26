import 'package:flutter/material.dart';
import 'package:life_partner/cardsScrol/data.dart';
import 'package:life_partner/cardsScrol/src/widgets/cool_swiper.dart';
import 'package:life_partner/cardsScrol/widgets/card_content.dart';
import 'package:life_partner/model/exr_model.dart';
import 'package:life_partner/shared/componant/componant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExrScreen extends StatefulWidget {
  Exercise? item;

  ExrScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<ExrScreen> createState() => _ExrScreenState();
}

class _ExrScreenState extends State<ExrScreen> {
  late TextEditingController _idController;

  late TextEditingController _seekToController;

  late PlayerState _playerState;

  late YoutubeMetaData _videoMetaData;

  double _volume = 100;

  bool _muted = false;

  bool _isPlayerReady = false;
  late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    String? videoId;
    videoId = YoutubePlayer.convertUrlToId("${widget.item?.uRL}");
    print(videoId);
    print(widget.item?.sId); // BBAyRBTfsOU
// BBAyRBTfsOU
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        loop: false,
      ),
    )..addListener(listener);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        child: SafeArea(
          top: true,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    width: double.infinity,
                    progressIndicatorColor: Colors.white54.withOpacity(.4),
                    onReady: () => _controller.addListener(listener),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 2 / 5,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(20),
                  child: CoolSwiper(
                    children: List.generate(
                      Data.colors.length,
                      (index) => CardContent(color: Data.colors[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
