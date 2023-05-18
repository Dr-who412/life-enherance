import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/module/homeScreen/cubit/state.dart';
import 'package:life_partner/shared/componant/constant.dart';
import 'package:life_partner/shared/network/httpHelper.dart';
import '../../../model/auth_model/doctors.dart';
import '../../../shared/network/api.dart';
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
  if(index==3){
    getAllDoctor();
  }
}
///get Doctor
List <DoctorModel>doctors=[];
getAllDoctor(){
  emit(GetDoctorsLoading());
  doctors=[];
  getData(pathUrl: AppApi.GetAllDoctor,token: AppConstant.Token ,).
  then((value) {
    value.forEach((element) {
      doctors.add(DoctorModel.fromJson(element));
    });
    print(doctors.length);
    emit(GetDoctorsSuccess());
  }).catchError((error){

    emit(GetDoctorsError());
  });
}
DoctorModel? doctorProfile;
getSpacificDoctor(){
  emit(GetDoctorProfileLoading());
  getData(pathUrl: AppApi.GetDocProfile,token: AppConstant.Token ,).
  then((value) {
    doctorProfile=value;
    emit(GetDoctorProfileSuccess());
  }).catchError((error){

    emit(GetDoctorProfileError());
  });
}

}