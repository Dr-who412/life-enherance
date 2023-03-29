
import 'package:flutter/material.dart';
import 'package:life_partner/shared/componant/componant.dart';

import '../../../shared/style/colors.dart';

class Doctor extends StatelessWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CastumCard(
          color: WHITE.withOpacity(.4),
          child: TextFormField(
            minLines: 1,
            decoration: InputDecoration(
              hintText: 'search',
               hintStyle: TextStyle(color: Colors.white60),
               prefixIcon: Icon(Icons.search,color: Colors.white60),
              border: InputBorder.none,
            ),
          ),
        ),
       DoctorCard(context: context),
      ],
    );
  }
}
