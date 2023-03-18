import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:life_partner/shared/componant/componant.dart';

import '../../../shared/style/colors.dart';
class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6,),
              CastumCard(

                  color: DARK,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text("Mange your\ntime well",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset("assets/todo/uprightarrow.png")),
                    Image.asset("assets/todo/planning.png"),
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Text("Daily Tasks",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
              todoTask(),
              todoTask(),
              todoTask(),
            ],
          );
  }
}
