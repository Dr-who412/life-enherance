import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'daily_workout.dart';

class ShoulderScreen extends StatefulWidget {
  const ShoulderScreen({Key? key}) : super(key: key);

  @override
  State<ShoulderScreen> createState() => _ShoulderScreenState();
}

class _ShoulderScreenState extends State<ShoulderScreen> {
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
        'assets/videos/dumbbell_front_raise.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller2 = VideoPlayerController.asset(
        'assets/videos/dumbbell_lateral_raise.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller3 = VideoPlayerController.asset(
        'assets/videos/reverse_fly.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller4 = VideoPlayerController.asset(
        'assets/videos/seated_military_press.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller5 = VideoPlayerController.asset(
        'assets/videos/plank_dumbbell_shoulder_raise.mp4')
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
                        const Text(
                          '''Do shoulder workouts twice a week, Start with this approach:
First 10 minutes: Stretch the upper body, shoulders and back muscles.
Next 20 to 30 minutes: Shoulder exercises (listed below) paired with upper body training, such as chest, back and arms.
Next 5 to 10 minutes: Light stretching.
Last 10 to 20 minutes: Cap it off with cardio or high-intensity interval training.
                          ''',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const Center(child: Text(' Try 10 reps in a good form'))
                      ],
                    ),
                  ),
                ),
                ExerciseCard(_controller1,'1. Dumbbell Front Raise', 'Equipment: Two dumbbells'),
                ExerciseCard(_controller2,'2. Dumbbell Lateral Raise', 'Equipment: Two dumbbells'),
                ExerciseCard(_controller3,'3. Reverse Fly', 'Equipment: Two dumbbells'),
                ExerciseCard(_controller4,'4. Seated Military Press', 'Equipment: Two dumbbells'),
                ExerciseCard(_controller5,'5. Plank Dumbbell Shoulder Raise', 'Equipment: Two dumbbells'),
              ],
            ),
          ),
        ));
  }
}
