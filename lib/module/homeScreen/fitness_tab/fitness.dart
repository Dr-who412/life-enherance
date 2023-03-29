import 'package:flutter/material.dart';
class Traning extends StatelessWidget {
  const Traning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MeasuringWidget(0, 'WORKOUT'),
            MeasuringWidget(0, 'KCAL'),
            MeasuringWidget(0, 'MINUTE'),
          ],
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 64),
          elevation: 10,
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          child: Column(
            children: [
              Text('WEEK GOAL'),
              Center(
                child: Column(
                  children: [
                    Text('Set weekly goals for a better body shape'),
                    FloatingActionButton(onPressed: (){}, child: Text('SET A GOAL'),)
                  ]
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
class MeasuringWidget extends StatelessWidget {
  int counter;
  String label;
MeasuringWidget(this.counter, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(counter as String),
        Text(label)
      ],
    );
  }
}

