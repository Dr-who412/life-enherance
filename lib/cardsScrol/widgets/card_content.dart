import 'package:flutter/material.dart';
import 'package:life_partner/cardsScrol/src/constants.dart';
import 'package:life_partner/module/homeScreen/cubit/homeCubit.dart';
import 'package:life_partner/module/homeScreen/traningsc.dart';

class CardContent extends StatelessWidget {
  final Color color;
  final int index;
  final Function onTap;
  const CardContent({
    Key? key,
    required this.index,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 28,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        height: Constants.cardHeight,
        // padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: CategoryWidget2(
          item: HomeCubit.get(context).exrModel?.exercise[index],
          onTap: () {
            print('wwww');
            HomeCubit.get(context).changeVedioId();
          },
        ),
      ),
    );
  }
}
