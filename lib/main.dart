import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/module/homeScreen/cubit/homeCubit.dart';
import 'module/authScreen/login.dart';
import 'package:life_partner/fitness_details/daily_workout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>HomeCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      home: Login(),
      /*  initialRoute: Login.routeName,
        routes: {
          Login.routeName: (_) => Login(),
          DailyWorkout.routeName: (_) => DailyWorkout()
        },*/
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

