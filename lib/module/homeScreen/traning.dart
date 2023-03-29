import 'package:flutter/material.dart';
class Traning extends StatelessWidget {
  const Traning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MeasuringWidget(0, 'WORKOUT'),
            MeasuringWidget(0, 'KCAL'),
            MeasuringWidget(0, 'MINUTE'),
          ],
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          elevation: 10,
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WEEK GOAL', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),

                Center(
                  child: Column(
                   // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Set weekly goals for a better body shape',style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 5),
                        ElevatedButton(onPressed: (){}, child: Text('SET A GOAL'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Color(0xFF3E6864)
                        ))
                      ]
                  ),
                )
              ],
            ),
          ),
        ),
        Row(
          children: [

            Expanded(
              child: Column(
                children:[
                  CategoryWidget('ABS', 'assets/training_images/abs.png'),
                  SizedBox(height: 5),
                  CategoryWidget('ARM', 'assets/training_images/arm.png' ),
                ]
              ),
            ),
            SizedBox(width:8),
            Expanded(child: CategoryWidget('CHEST', 'assets/training_images/chest.png'))
          ]
        ),
        SizedBox(height:10),
        Row(
          children: [
            Expanded(child: CategoryWidget('LEG','assets/training_images/leg.png' )),
            SizedBox(width: 8),
            Expanded(child: CategoryWidget('SHOULDER', 'assets/training_images/shoulder.png')),
          ],
        ),
        SizedBox(height:10),
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
        Text('$counter'),
        Text(label)
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  String categoryName;
  String imagePath;
  CategoryWidget(this.categoryName, this.imagePath);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Image.asset(imagePath),
          Positioned(
              top: 10,
              left: 10,
              child: Text(categoryName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:14,
                      fontWeight: FontWeight.bold))),
        ]
      ),
    );
  }
}
