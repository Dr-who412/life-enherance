import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/module/authScreen/sign_cubit/sign_state.dart';
import 'package:life_partner/module/bmiScreen/questions.dart';

import '../../shared/componant/componant.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  double hight = 150;
  int age = 18;
  double wight = 50.0;
  bool isMale = true;
  bool isFemale = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        body: BackGround(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMale = true;
                        isFemale = !isMale;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color:
                            isMale ? HexColor('#8CE1FE') : HexColor('#0A1C1C'),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/icon/man.png'),
                          Text(
                            "male",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFemale = true;
                        isMale = !isFemale;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: isFemale
                            ? HexColor('#FF94D4')
                            : HexColor('#0A1C1C'),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/icon/female.png'),
                          Text(
                            "female",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: HexColor('#0A1C1C'),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hight",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${hight.round()}",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                    Slider(
                      value: hight,
                      mouseCursor: MouseCursor.defer,
                      onChanged: (value) {
                        setState(() {
                          hight = value;
                        });
                      },
                      activeColor: HexColor('#3E6864'),
                      max: 220,
                      min: 80,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 34,
                                color: HexColor("#0A1C1C"))),
                        Text(
                          "$age",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: HexColor("#0A1C1C")),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              heroTag: "age++",
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              backgroundColor: HexColor("#0A1C1C"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              heroTag: "age--",
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              backgroundColor: HexColor("#0A1C1C"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Wight",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              color: HexColor("#0A1C1C")),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "$wight",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: HexColor("#0A1C1C")),
                            ),
                            Text(
                              "Kg",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: HexColor("#0A1C1C")),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  wight++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              backgroundColor: HexColor("#0A1C1C"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  wight--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              backgroundColor: HexColor("#0A1C1C"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: HexColor('#0A1C1C'),
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  "${(wight / pow(hight.round() / 100, 2)).round()} BMI",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
// =======
//                     borderRadius: BorderRadius.circular(12),
//
//                   ),
//                   child: Text("${(wight/pow(hight.round()/100,2)).round()} BMI",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
// >>>>>>> be4c9d56b50b95f0ef07e1770466e50afd77fb0f
              ),
              BlocListener<SignCubit, SignState>(
                listener: (context, state) {
                  // TODO: implement listener}
                },
                child: FloatingActionButton(
                  heroTag: 'bmi',
                  onPressed: () {
                    SignCubit.get(context).BMI =
                        (wight / pow(hight.round() / 100, 2)).round();
                    SignCubit.get(context).height = hight.round();
                    SignCubit.get(context).weight = (wight).round();
                    SignCubit.get(context).age = age;
                    SignCubit.get(context).isMale = isMale ? true : false;
                    // todo: update user data (bmi and image) to server
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Questions()));
                    // SignCubit.get(context).updateDate(
                    //     BMI: (wight / pow(hight.round() / 100, 2)).round(),
                    //     height: hight.round(),
                    //     age: age,
                    //     weight: wight.round(),
                    //     isMale: isMale ? true : false);
                  },
                  elevation: 6,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_forward,
                    color: HexColor("#0A1C1C"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
