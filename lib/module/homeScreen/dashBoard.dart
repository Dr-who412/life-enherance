import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/componant/componant.dart';
import '../../shared/style/colors.dart';

class DashBord extends StatelessWidget {
  const DashBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "today",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text(
              "Good Morning",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios_rounded),
              color: Colors.white,
            )
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Report",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 6),
        Flexible(
          fit: FlexFit.loose,

          child: CastumCard(
            color: Colors.white,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Goals",
                    style: TextStyle(
                        color: HexColor("#0A1C1C"), fontWeight: FontWeight.bold),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/dash/circularchart.png"),
                    Column(
                      children: [
                        Text(
                          "938/2500",
                          style: TextStyle(
                              color: HexColor("#0A1C1C"),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Calories",
                          style: TextStyle(
                              color: Colors.black26, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(

                  children: [
                    Expanded(
                      child: DashSection(
                          title: 'Net Carbs',
                          limit: "5/31g",
                          used: "22g left",
                          titleColor: Colors.white,
                          dashColor: HexColor("#198787")),
                    ),

                    Expanded(
                      child: DashSection(
                          title: 'Protens',
                          limit: "5/31g",
                          used: "22g left",
                          titleColor: HexColor("#787878"),
                          dashColor: HexColor("#EFEEE9")),
                    ),

                    Expanded(
                      child: DashSection(
                          title: 'Fat',
                          limit: "5/31g",
                          used: "22g left",
                          titleColor: Colors.white,
                          dashColor: HexColor("#D1722C").withOpacity(.4)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CastumCard(
              color: DARK,
              child: Column(
                children: [
                  Image.asset("assets/dash/coffee.png"),
                  Text(
                    "BreakFast",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "234 col,\n no carbs",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text(
                            "Add BreakFast",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CastumCard(
                  color: DARK,
                  child: Column(
                    children: [
                      //Icon(Icons.add,color: Colors.white,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/dash/sunny.png"),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Lunch",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "234 col,\n no carbs",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                CastumCard(
                  child: Column(
                    children: [
                      //Icon(Icons.add,color: Colors.white,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/dash/moon.png"),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Dinner",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "234 col,\n no carbs",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  color: DARK),

              ],
            ),
          ],
        )
      ],
    );
  }
}
