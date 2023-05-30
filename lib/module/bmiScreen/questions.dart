import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:life_partner/layout/homeLayout.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/module/authScreen/sign_cubit/sign_state.dart';
import 'package:life_partner/module/bmiScreen/questionItem.dart';
import 'package:life_partner/shared/componant/componant.dart';

class Questions extends StatelessWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        body: BackGround(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                QuestionItem(
                  index: 0,
                  ontap: () {
                    print('object 0');
                  },
                ),
                QuestionItem(
                  index: 1,
                  ontap: () {
                    print('object 1');
                  },
                ),
                QuestionItem(
                  index: 2,
                  ontap: () {
                    print('object 2');
                  },
                ),
                QuestionItem(
                  index: 3,
                  ontap: () {
                    print('object 3');
                  },
                ),
                QuestionItem(
                  index: 4,
                  ontap: () {
                    print('object 4');
                  },
                ),
                QuestionItem(
                  index: 5,
                  ontap: () {
                    print('object 4');
                  },
                ),
                QuestionItem(
                  index: 6,
                  ontap: () {
                    print('object 5');
                  },
                ),
                BlocListener<SignCubit, SignState>(
                  listener: (context, state) {
                    // TODO: implement listener}
                    // if (state is UpdateUSerSuccessState) {
                    //   SignCubit.get(context).
                    //   Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (_) => HomeLayout()),
                    //     (route) => false,
                    //   );
                    // }
                  },
                  child: BlocConsumer<SignCubit, SignState>(
                    listener: (context, state) {
                      print('state :: $state');
                      // TODO: implement listener
                      if (state is SendAnsSuccessState) {
                        SignCubit.get(context).updateDate();
                      }
                      if (state is UpdateUSerSuccessState) {
                        SignCubit.get(context).getWeeklyDiet();
                      }
                      if (state is getWeeklyDietSuccess) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => HomeLayout()),
                          (route) => false,
                        );
                      }
                    },
                    builder: (context, state) {
                      return FloatingActionButton(
                        heroTag: 'que',
                        onPressed: () {
                          // todo: update user data (bmi and image) to server
                          if ((state is SendAnsLoadingState) == false) {
                            SignCubit.get(context).sendAnswer();
                          }
                        },
                        elevation: 6,
                        backgroundColor: Colors.white,
                        child: Icon(
                          state is SendAnsLoadingState
                              ? Icons.send_outlined
                              : Icons.arrow_forward,
                          color: HexColor("#0A1C1C"),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
