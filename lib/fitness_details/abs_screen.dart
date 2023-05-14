import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'daily_workout.dart';

class AbsScreen extends StatefulWidget {
  const AbsScreen({Key? key}) : super(key: key);

  @override
  State<AbsScreen> createState() => _AbsScreenState();
}

class _AbsScreenState extends State<AbsScreen> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VideoPlayerController _controller4;
  late VideoPlayerController _controller5;
  late VideoPlayerController _controller6;
  late VideoPlayerController _controller7;

  //controller.initialize();
  @override
  void initState() {
    super.initState();

    _controller1 =
        VideoPlayerController.asset('assets/videos/plank.mp4')
          ..initialize().then((_) {
            setState(() {});
          });

    _controller2 = VideoPlayerController.asset(
        'assets/videos/glute_bridge_mark.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller3 =
        VideoPlayerController.asset('assets/videos/dead_bug.mp4')
          ..initialize().then((_) {
            setState(() {});
          });

    _controller4 = VideoPlayerController.asset(
        'assets/videos/seated_rotation.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller5 = VideoPlayerController.asset(
        'assets/videos/mountain_climbers.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller6 = VideoPlayerController.asset(
        'assets/videos/vup.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller7 = VideoPlayerController.asset(
        'assets/videos/reverse_crunch.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
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
        child: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
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
                      'Choose three exercises from the list below.'
                      ' Perform each for 30 to 60 seconds, then immediately continue to your next move.'
                      ' Once you have completed all three, rest for 15 to 30 seconds,'
                      ' then repeat for 3 to 5 total rounds.',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            ExerciseCard(_controller1, '1. Plank', ''),
            ExerciseCard(_controller2, '2. Glute Bridge Mark', ''),
            ExerciseCard(_controller3, '3. DeadBug', ''),
            ExerciseCard(_controller4, '4. Seated Rotation', ''),
            ExerciseCard(_controller5, '5. Mountain Climbers', ''),
            ExerciseCard(_controller6, '6. V-up', ''),
            ExerciseCard(_controller7, '7. Reverse Crunch', ''),

          ],
        ),
      ),
    ));
  }
}
