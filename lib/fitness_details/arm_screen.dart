import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'daily_workout.dart';

class ArmScreen extends StatefulWidget {
  const ArmScreen({Key? key}) : super(key: key);

  @override
  State<ArmScreen> createState() => _ArmScreenState();
}

class _ArmScreenState extends State<ArmScreen> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VideoPlayerController _controller4;
  late VideoPlayerController _controller5;

  //controller.initialize();
  @override
  void initState() {
    super.initState();

    _controller1 = VideoPlayerController.asset(
        'assets/videos/incline_bicep_curl.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller2 = VideoPlayerController.asset(
        'assets/videos/concentration_curl.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller3 = VideoPlayerController.asset(
        'assets/videos/diamond_press_up.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller4 = VideoPlayerController.asset(
        'assets/videos/multi_grip_drop_sets.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller5 = VideoPlayerController.asset(
        'assets/videos/skull_crusher.mp4')
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
                        const Text('If you want to build big arms then you are going to need to work out your biceps, triceps and forearms,'
                            ' which is why we have selected exercises that hit all three muscle groups.',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                ExerciseCard(_controller1,'1. Incline Bicep Curl', 'Equipment: Single medium-weight dumbbell.'),
                ExerciseCard(_controller2,'2. Concentration Curl', 'Equipment: Single medium-weight dumbbell.'),
                ExerciseCard(_controller3,'3. Diamond Press up', ''),
                ExerciseCard(_controller4,'4. Multi Grip Drop Sets', 'Equipment: Two medium-weight dumbbells.'),
                ExerciseCard(_controller5,'5. Skull Crusher', 'Equipment: A  barbell or ez bar'),
              ],
            ),
          ),
        ));
  }
}
