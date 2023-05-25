import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/layout/homeLayout.dart';
import 'package:life_partner/module/authScreen/login.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/module/authScreen/sign_cubit/sign_state.dart';

import '../../shared/componant/componant.dart';
import '../../shared/style/colors.dart';
import 'addUserImage.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();
  var formKay = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
          child: Center(
        child: CastumCard(
          color: WHITE,
          child: Form(
            key: formKay,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 35,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                  margin: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: DARK, borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: InkWell(
                          onTap: () {
                            NavigatPushTo(context: context, widget: Login());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: WHITE,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text("login",
                                style: TextStyle(
                                  color: DARK,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                TextFaildCustom(
                  controller: nameController,
                  type: TextInputType.text,
                  isPassword: false,
                  prefix: Icons.person,
                  validate: (value) {
                    if (value.isEmpty) {
                      return "name can't be empty";
                    }
                    return null;
                  },
                  hint: 'user name',
                ),
                TextFaildCustom(
                  controller: emailController,
                  type: TextInputType.text,
                  isPassword: false,
                  prefix: Icons.email,
                  validate: (value) {
                    if (value.isEmpty) {
                      return "email can't be empty";
                    }
                    return null;
                  },
                  hint: 'your account @gmail.com',
                ),
                TextFaildCustom(
                    controller: passwordController,
                    type: TextInputType.text,
                    prefix: Icons.lock,
                    suffix: Icons.visibility,
                    isPassword: true,
                    validate: (value) {
                      if (value.isEmpty) {
                        return "Password is short";
                      }
                      return null;
                    },
                    hint: 'password'),
                TextFaildCustom(
                  controller: confirmpasswordController,
                  type: TextInputType.text,
                  isPassword: true,
                  validate: (value) {
                    if (value.isEmpty) {
                      return "Password is short";
                    }
                    return null;
                  },
                  hint: 'confirm password',
                ),
                SizedBox(
                  height: 12,
                ),
                BlocConsumer<SignCubit, SignState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is SignInWithGooglFirstTime) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => AddUserImage()));
                    }
                    if (state is SignInWithGooglOld) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomeLayout()));
                    }
                  },
                  builder: (context, state) {
                    return ConditionalBuilder(
                      condition: state is! SignInLoadingState,
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {
                            if (formKay.currentState!.validate()) {
                              SignCubit.get(context).singUp(
                                  email: emailController.text,
                                  name: nameController.text,
                                  password: passwordController.text);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(14),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                                color: DARK,
                                borderRadius: BorderRadius.circular(25)),
                            child: Text(
                              "sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                      fallback: (BuildContext context) => Center(
                          child: CircularProgressIndicator(
                        color: Colors.teal,
                      )),
                    );
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    SignCubit.get(context).signInGoogle();
                  },
                  child: Image.asset("assets/icon/google.png"),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
