import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:life_partner/layout/homeLayout.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/module/authScreen/sign_cubit/sign_state.dart';
import 'package:life_partner/shared/componant/componant.dart';

import 'disorder.dart';

class Disorder extends StatelessWidget {
  const Disorder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SignCubit.get(context).disorderAns = [];
    return SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Scaffold(
            body: BackGround(
                child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      SignCubit.get(context).disorderModel?.questions?.length,
                  itemBuilder: (context, index) {
                    SignCubit.get(context).disorderAns.add(2);
                    return QuestionWidget(
                      question:
                          '${SignCubit.get(context).disorderModel?.questions![index].question} ?',
                      maxAns:
                          '${SignCubit.get(context).disorderModel?.questions![index].answer}',
                      answers: ['Always', 'Sometimes', 'Never'],
                      onAnswerSelected: () {},
                      ind: index,
                    );
                  }),
              BlocConsumer<SignCubit, SignState>(
                listener: (context, state) {
                  print('state :: $state');
                  // TODO: implement listener
                  if (state is SendAnsSuccessState) {
                    SignCubit.get(context).updateDate();
                  }
                  if (state is sendDisorderSucccess) {
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
                      if ((state is sendDisorderLoading) == false) {
                        SignCubit.get(context).postDisorderResult();
                      }
                    },
                    elevation: 6,
                    backgroundColor: Colors.white,
                    child: Icon(
                      state is sendDisorderLoading
                          ? Icons.send_outlined
                          : Icons.arrow_forward,
                      color: HexColor("#0A1C1C"),
                    ),
                  );
                },
              )
            ],
          ),
        ))));
  }
}
