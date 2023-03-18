import 'package:flutter/material.dart';
import 'package:life_partner/shared/style/colors.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('set your new goal',style: TextStyle(fontWeight: FontWeight.bold,color: WHITE),)
          ],
        ),
      ),
    );
  }
}
