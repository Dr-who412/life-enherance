import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/module/homeScreen/cubit/homeCubit.dart';
import 'package:life_partner/module/homeScreen/cubit/state.dart';
import 'package:life_partner/shared/componant/componant.dart';

import '../../../shared/style/colors.dart';

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 6,
        ),
        CastumCard(
          color: DARK,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                "Mange your\ntime well",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              )),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset("assets/todo/uprightarrow.png")),
              Image.asset("assets/todo/planning.png"),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Daily Tasks",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 2 / 3,
          child: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
            // TODO: implement listener
          }, builder: (context, state) {
            return ConditionalBuilder(
              condition: !(state is loadingTodoState) &&
                  HomeCubit.get(context).todo?.status == true,
              builder: (BuildContext context) => ListView.builder(
                itemCount:
                    (HomeCubit.get(context).todo?.exercise?.length ?? 0 + 3),
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) =>
                    todoTask(
                        task: (index + 1) %
                                    (HomeCubit.get(context)
                                            .todo
                                            ?.exercise
                                            ?.length ??
                                        0 + 2) ==
                                0
                            ? '${HomeCubit.get(context).todo?.diet[index % 3].title} ${index % 3}'
                            : '${HomeCubit.get(context).todo?.exercise[index].title}'),
              ),
              fallback: (BuildContext context) => state is loadingTodoState ||
                      HomeCubit.get(context).todo == null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 2 / 5,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator())
                  : Container(
                      height: MediaQuery.of(context).size.height * 2 / 5,
                      alignment: Alignment.center,
                      child: Text('Empty tasks !'),
                    ),
            );
          }),
        ),
      ],
    );
  }
}
