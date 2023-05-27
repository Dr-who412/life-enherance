import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/layout/homeLayout.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/module/homeScreen/cubit/homeCubit.dart';
import 'package:life_partner/shared/componant/constant.dart';
import 'package:life_partner/shared/shared_preference/cachHelper.dart';

import 'firebase_options.dart';
import 'module/authScreen/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  AppConstant.Token = await CacheHelper.getdata(key: 'token') ?? '';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignCubit()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: (AppConstant.Token != null && AppConstant.Token.isNotEmpty)
            ? HomeLayout()
            : Login(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
