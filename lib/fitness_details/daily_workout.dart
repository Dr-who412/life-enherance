import 'package:flutter/material.dart';
import 'package:life_partner/module/homeScreen/cubit/state.dart';
import '../../shared/componant/componant.dart';
import 'package:video_player/video_player.dart';
class DailyWorkout extends StatefulWidget {
  static const String routeName = 'daily workout';

  @override
  State<DailyWorkout> createState() => _DailyWorkoutState();
}

class _DailyWorkoutState extends State<DailyWorkout> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VideoPlayerController _controller4;
  late VideoPlayerController _controller5;
  late VideoPlayerController _controller6;


  //controller.initialize();
  @override
  void initState() {
    super.initState();

    _controller1 = VideoPlayerController.asset(
        'assets/videos/plank_toe_touch.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller2 = VideoPlayerController.asset(
        'assets/videos/lateral_hop.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller3 = VideoPlayerController.asset(
        'assets/videos/single_leg_deadlift.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller4 = VideoPlayerController.asset(
        'assets/videos/jump_squats.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller5 = VideoPlayerController.asset(
        'assets/videos/forearm_press_up.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller6 = VideoPlayerController.asset(
        'assets/videos/hollowhold.mp4')
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
                      'Perform each bodyweight move below for the indicated amount of time,'
                          ' then continue immediately on to the next as quickly as possible.'
                          ' Once you have completed all six exercises,'
                          ' repeat twice more for a total of three rounds.',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            ExerciseCard(_controller1,'1. Plank Toe Touch', 'Repeat for 45 seconds'),
            ExerciseCard(_controller2,'2. Lateral Hop', 'Repeat for 45 seconds'),
            ExerciseCard(_controller3,'3. Single Leg Deadlift', 'Repeat for 45 seconds'),
            ExerciseCard(_controller4,'4. Jump Squat', 'Repeat for 45 seconds'),
            ExerciseCard(_controller5,'5. Forearm Press up', 'Repeat for 45 seconds'),
            ExerciseCard(_controller6,'6. Hollow Hold', 'Hold this position for 30 seconds'),
          ],
        ),
      ),
    ));
  }
}

class ExerciseCard extends StatefulWidget {
  String exerciseDescription;
  VideoPlayerController _controller ;
  String exerciseTitle;
  ExerciseCard(this._controller,this.exerciseTitle, this.exerciseDescription);

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.exerciseTitle,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            widget._controller.value.isInitialized
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: double.infinity,
                        height: 170,
                        child: VideoPlayer(widget._controller)),
                  )
                : Container(),
            // SizedBox(height: 10,),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        widget._controller.value.isPlaying
                            ? widget._controller.pause()
                            : widget._controller.play();
                      },
                    );
                  },
                  child: Icon(Icons.play_arrow)),
            ),
            Center(child: Text(widget.exerciseDescription)),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

