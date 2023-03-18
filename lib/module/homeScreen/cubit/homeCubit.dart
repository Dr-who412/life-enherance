import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/module/homeScreen/cubit/state.dart';
import '../dashBoard.dart';
import '../doctorScreen/doctor.dart';
import '../todo/toDo.dart';
import '../traning.dart';

class HomeCubit extends Cubit<HomeState>{
HomeCubit():super(InitState());
static  HomeCubit get(context)=>BlocProvider.of(context);
int currentScreen=0;
List <Widget>Screens=[
  DashBord(),
  ToDo(),
  Traning(),
  Doctor(),
];
void ChangeNavBarScreen({required index}){
  currentScreen=index;
  emit(ChangeNavBar());
}

}