import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/layout/homeLayout.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/module/authScreen/sign_cubit/sign_state.dart';
import 'package:life_partner/shared/componant/constant.dart';

import 'login.dart';

class Splach extends StatelessWidget {
  const Splach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignCubit, SignState>(
      listener: (context, state) {
        // TODO: implement listener}
        if (state is GetUserDataSucces && SignCubit.get(context).user != null) {
          Future.delayed(
            Duration(microseconds: 2200),
            () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeLayout()),
              (route) => false,
            ),
          );
        }
        if (AppConstant.Token.isEmpty || AppConstant.Token == null) {
          Future.delayed(
            Duration(microseconds: 2200),
            () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false,
            ),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            "assets/splash.png",
          ),
        ),
      ),
    );
  }
}
