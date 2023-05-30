import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/module/authScreen/sign_cubit/sign_state.dart';

import '../../shared/componant/componant.dart';
import '../../shared/style/colors.dart';
import 'dirte_meal/dite-screen.dart';

class DashBord extends StatelessWidget {
  const DashBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
                        color: HexColor("#0A1C1C"),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/dash/circularchart.png"),
                    Column(
                      children: [
                        BlocConsumer<SignCubit, SignState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return Text(
                              "${SignCubit.get(context).dayMeal?.nutrients?.calories?.round()}/${SignCubit.get(context).user?.user?.bmr?.round() ?? '0'}",
                              style: TextStyle(
                                  color: HexColor("#0A1C1C"),
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                        Text(
                          "Calories",
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                BlocConsumer<SignCubit, SignState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = SignCubit.get(context);
                    return Row(
                      children: [
                        Expanded(
                          child: DashSection(
                              title: 'carbohydrates',
                              limit:
                                  "${cubit.dayMeal?.nutrients?.carbohydrates}",
                              used: "",
                              titleColor: Colors.white,
                              dashColor: HexColor("#198787")),
                        ),
                        Expanded(
                          child: DashSection(
                              title: 'Protens',
                              limit: "${cubit.dayMeal?.nutrients?.protein}",
                              used: "22g left",
                              titleColor: HexColor("#787878"),
                              dashColor: HexColor("#EFEEE9")),
                        ),
                        Expanded(
                          child: DashSection(
                              title: 'Fat',
                              limit: "${cubit.dayMeal?.nutrients?.fat}",
                              used: "22g left",
                              titleColor: Colors.white,
                              dashColor: HexColor("#D1722C").withOpacity(.4)),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
        Flexible(
          child: BlocConsumer<SignCubit, SignState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is getMealDietSuccess) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DiteScreen()));
              }
            },
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        print(
                            '${SignCubit.get(context).dayMeal?.meals![0].id}');

                        SignCubit.get(context).getMealById(
                            mealId:
                                '${SignCubit.get(context).dayMeal?.meals![0].id}');
                        SignCubit.get(context).choosedMeals = 0;
                      },
                      child: CastumCard(
                        color: DARK,
                        child: Column(
                          children: [
                            Image.asset("assets/dash/coffee.png"),
                            Text(
                              "BreakFast",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${SignCubit.get(context).dayMeal?.meals![0].title}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            print(
                                '${SignCubit.get(context).dayMeal?.meals![1].id}');
                            SignCubit.get(context).getMealById(
                                mealId:
                                    '${SignCubit.get(context).dayMeal?.meals![1].id}');
                            SignCubit.get(context).choosedMeals = 1;
                          },
                          child: CastumCard(
                            color: DARK,
                            child: Column(
                              children: [
                                //Icon(Icons.add,color: Colors.white,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                  "${SignCubit.get(context).dayMeal?.meals![1].title}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print(
                                '${SignCubit.get(context).dayMeal?.meals![2].id}');

                            SignCubit.get(context).getMealById(
                                mealId:
                                    '${SignCubit.get(context).dayMeal?.meals![2].id}');
                            SignCubit.get(context).choosedMeals = 2;
                          },
                          child: CastumCard(
                              child: Column(
                                children: [
                                  //Icon(Icons.add,color: Colors.white,),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                    "${SignCubit.get(context).dayMeal?.meals![2].title}",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              color: DARK),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
