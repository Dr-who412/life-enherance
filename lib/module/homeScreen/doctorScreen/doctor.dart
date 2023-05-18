import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/shared/componant/componant.dart';

import '../../../shared/style/colors.dart';
import '../cubit/homeCubit.dart';
import '../cubit/state.dart';

class Doctor extends StatelessWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CastumCard(
          color: WHITE.withOpacity(.4),
          child: TextFormField(
            minLines: 1,
            decoration: InputDecoration(
              hintText: 'search',
              hintStyle: TextStyle(color: Colors.white60),
              prefixIcon: Icon(Icons.search, color: Colors.white60),
              border: InputBorder.none,
            ),
          ),
        ),
        BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: ConditionalBuilder(
                condition: state is! GetDoctorsLoading,
                builder:(context)=>ListView.builder(
                    itemCount: HomeCubit
                        .get(context)
                        .doctors
                        .length,
                    itemBuilder: (BuildContext context, int index) =>DoctorCard(context: context,item: HomeCubit
                        .get(context)
                        .doctors[index] ),

                ),
                fallback: (BuildContext context) =>
                    Center(child: CircularProgressIndicator(color: Colors.white.withOpacity(0.6),)),

              ),
            );
          },
        )

      ],
    );
  }
}
