import 'package:flutter/material.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/shared/style/colors.dart';

enum answerEnum { always, sometime, never }

class QuestionWidget extends StatefulWidget {
  final String question;
  final String maxAns;

  final List<String> answers;
  final Function onAnswerSelected;
  final int ind;

  QuestionWidget({
    required this.question,
    required this.maxAns,
    required this.answers,
    required this.onAnswerSelected,
    required this.ind,
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  answerEnum queAns = answerEnum.sometime;

  @override
  Widget build(BuildContext context) {
    return Card(
        key: Key('${widget.ind}'),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.question,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  children: [
                    Radio<answerEnum>(
                      value: answerEnum.always,
                      groupValue: queAns,
                      onChanged: (answerEnum? aSelect) {
                        print('selected');
                        setState(() {
                          queAns = aSelect!;
                          if (widget.maxAns == 'always') {
                            SignCubit.get(context)
                                .setDisorderAns(widget.ind, 3);
                          } else {
                            SignCubit.get(context)
                                .setDisorderAns(widget.ind, 1);
                          }
                        });

                        // onAnswerSelected!();
                      },
                    ),
                    Text('always'),
                  ],
                ),
                Row(
                  children: [
                    Radio<answerEnum>(
                      value: answerEnum.sometime,
                      groupValue: queAns,
                      onChanged: (answerEnum? aSelect) {
                        print('selected');
                        setState(() {
                          queAns = aSelect!;
                          SignCubit.get(context).setDisorderAns(widget.ind, 2);
                        });

                        // onAnswerSelected!();
                      },
                    ),
                    Text('sometime'),
                  ],
                ),
                Row(
                  children: [
                    Radio<answerEnum>(
                      value: answerEnum.never,
                      groupValue: queAns,
                      onChanged: (answerEnum? aSelect) {
                        print('selected');
                        setState(() {
                          queAns = aSelect!;
                          if (widget.maxAns == 'never') {
                            SignCubit.get(context)
                                .setDisorderAns(widget.ind, 3);
                          } else {
                            SignCubit.get(context)
                                .setDisorderAns(widget.ind, 1);
                          }
                        });

                        // onAnswerSelected!();
                      },
                    ),
                    Text('never'),
                  ],
                ),
              ]

                  // widget.answers.map((answer) {
                  //   return Row(
                  //     children: [
                  //       Radio<answerEnum>(
                  //         value: answerEnum.sometime,
                  //         // answer == 'always'
                  //         //     ? answerEnum.always
                  //         //     : answer == 'never'
                  //         //         ? answerEnum.never
                  //         //         : answerEnum.sometime,
                  //         groupValue: queAns,
                  //         onChanged: (answerEnum? aSelect) {
                  //           print('selected');
                  //           setState(() {
                  //             queAns = aSelect!;
                  //           });
                  //           print('selected::$answer::');
                  //
                  //           // onAnswerSelected!();
                  //         },
                  //       ),
                  //       Text(answer),
                  //     ],
                  //   );
                  // }).toList(),
                  ),
            ],
          ),
        ));
  }
}
