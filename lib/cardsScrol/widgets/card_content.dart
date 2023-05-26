import 'dart:math';

import 'package:flutter/material.dart';
import 'package:life_partner/cardsScrol/src/constants.dart';
import 'package:life_partner/module/homeScreen/cubit/homeCubit.dart';
import 'package:life_partner/module/homeScreen/traningsc.dart';

class CardContent extends StatelessWidget {
  final Color color;

  const CardContent({
    Key? key,
    required this.color,
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
            item: HomeCubit.get(context)
                .exrModel
                ?.exercise[Random().nextInt(13)]),
        // Align(
        //   alignment: Alignment.bottomLeft,
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Container(
        //         height: 40,
        //         width: 40,
        //         decoration: BoxDecoration(
        //           color: Colors.red.withOpacity(0.2),
        //           shape: BoxShape.circle,
        //         ),
        //       ),
        //       const SizedBox(width: 15),
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Container(
        //             height: 15,
        //             width: 150,
        //             decoration: BoxDecoration(
        //               color: Colors.black.withOpacity(0.2),
        //               borderRadius: BorderRadius.circular(10),
        //             ),
        //           ),
        //           const SizedBox(height: 10),
        //           Container(
        //             height: 15,
        //             width: 100,
        //             decoration: BoxDecoration(
        //               color: Colors.black.withOpacity(0.2),
        //               borderRadius: BorderRadius.circular(10),
        //             ),
        //           ),
        //         ],
        //       )
        //     ],
        //   ),
      ),
    );
  }
}
