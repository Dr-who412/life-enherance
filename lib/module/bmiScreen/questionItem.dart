import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/module/authScreen/sign_cubit/sign_state.dart';
import 'package:life_partner/shared/style/colors.dart';

class QuestionItem extends StatelessWidget {
  Function ontap;
  final int index;
  QuestionItem({Key? key, required this.ontap, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: WHITE.withOpacity(.4),
        elevation: 16,
        shadowColor: DARKINDED,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                SignCubit.get(context).Ques[index],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              BlocConsumer<SignCubit, SignState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Row(
                    children: [
                      Spacer(),
                      Text(
                        'No',
                        style: TextStyle(
                            fontSize: 18,
                            color: !SignCubit.get(context).Answer[index]
                                ? Colors.white
                                : Colors.white.withOpacity(.4),
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Switch(
                        value: SignCubit.get(context).Answer[index],
                        onChanged: (val) {
                          ontap();
                          print("change ansver $val");
                          SignCubit.get(context)
                              .ChangeAnswer(answer: val, quIndex: index);
                        },
                      ),
                      Spacer(),
                      Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 18,
                            color: SignCubit.get(context).Answer[index]
                                ? Colors.white
                                : Colors.white.withOpacity(.4),
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}
