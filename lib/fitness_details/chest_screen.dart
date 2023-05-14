import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'daily_workout.dart';

class ChestScreen extends StatefulWidget {
  const ChestScreen({Key? key}) : super(key: key);

  @override
  State<ChestScreen> createState() => _ChestScreenState();
}

class _ChestScreenState extends State<ChestScreen> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VideoPlayerController _controller4;

  //controller.initialize();
  @override
  void initState() {
    super.initState();

    _controller1 = VideoPlayerController.asset(
        'assets/videos/barbell_bench_press.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller2 = VideoPlayerController.asset(
        'assets/videos/incline_dumbbell_bench_press.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller3 = VideoPlayerController.asset(
        'assets/videos/bodyweight_dip.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller4 = VideoPlayerController.asset(
        'assets/videos/bodyweight_push_up.mp4')
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
                ExerciseCard(_controller1,'Barbbell Bench Press', '''Equipment: A barbell
Tip: Grasp the bar slightly wider than shoulder width: your elbow, forearm and wrist should all be in line at the bottom of the movement'''),
                ExerciseCard(_controller2,'Incline Dumbbell Bench Press', '''Equipment: Two dumbbells
TIP: Don't angle the bench any higher than 60 degrees - this will keep the focus on your chest, rather than your shoulders'''),

                ExerciseCard(_controller3,'Bodyweight Dip', 'TIP: Leaning forward during the exercise will place more emphasis on the chest. Keeping the torso upright will result in more of the triceps being used'),
                ExerciseCard(_controller4,'Bodyweight Push-up', 'TIP: By raising the feet on a bench, the upper part (clavicle head) of the chest can be isolated.'),
              ],
            ),
          ),
        ));
  }
}
