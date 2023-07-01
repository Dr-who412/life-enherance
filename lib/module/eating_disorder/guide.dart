import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/module/authScreen/sign_cubit/sign_state.dart';
import 'package:life_partner/shared/componant/componant.dart';

class GuideScrean extends StatelessWidget {
  const GuideScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        child: SingleChildScrollView(
            child: BlocConsumer<SignCubit, SignState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state is sendDisorderLoading
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  )
                : SignCubit.get(context).goide != null
                    ? Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount:
                                SignCubit.get(context).goide?.guide?.length,
                            itemBuilder: (context, int index) {
                              return Text(
                                "${SignCubit.get(context).goide?.guide![0].guide}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }))
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "empty",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
          },
        )),
      ),
    );
  }
}
