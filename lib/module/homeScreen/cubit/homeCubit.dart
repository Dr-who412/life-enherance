import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/model/exr_model.dart';
import 'package:life_partner/module/homeScreen/cubit/state.dart';
import 'package:life_partner/module/homeScreen/traningsc.dart';
import 'package:life_partner/shared/componant/componant.dart';
import 'package:life_partner/shared/componant/constant.dart';
import 'package:life_partner/shared/network/httpHelper.dart';

import '../../../model/auth_model/doctors.dart';
import '../../../shared/network/api.dart';
import '../dashBoard.dart';
import '../doctorScreen/doctor.dart';
import '../todo/toDo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitState());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentScreen = 0;
  List<Widget> Screens = [
    DashBord(),
    ToDo(),
    Tranning2(),
    Doctor(),
  ];
  void ChangeNavBarScreen({required index}) {
    currentScreen = index;
    emit(ChangeNavBar());
    if (index == 3) {
      getAllDoctor();
    }
    if (index == 2) {
      print("gettt exr");
      getExerciseLevel();
    }
  }

  ///get Doctor
  List<DoctorModel> doctors = [];
  getAllDoctor() {
    emit(GetDoctorsLoading());
    doctors = [];
    getData(
      pathUrl: AppApi.GetAllDoctor,
      token: AppConstant.Token,
    ).then((value) {
      value.forEach((element) {
        doctors.add(DoctorModel.fromJson(element));
      });
      print(doctors.length);
      emit(GetDoctorsSuccess());
    }).catchError((error) {
      emit(GetDoctorsError());
    });
  }

  DoctorModel? doctorProfile;
  getSpacificDoctor() {
    emit(GetDoctorProfileLoading());
    getData(
      pathUrl: AppApi.GetDocProfile,
      token: AppConstant.Token,
    ).then((value) {
      doctorProfile = value;
      emit(GetDoctorProfileSuccess());
    }).catchError((error) {
      emit(GetDoctorProfileError());
    });
  }

//exr
  EXRModel? exrModel;
  getExerciseLevel() async {
    exrModel = null;
    emit(GetEXRLoading());
    await postData(
        pathUrl: AppApi.exerciseLevel,
        token: AppConstant.Token,
        body: {
          'level': '3',
        }).then((value) {
      print(value);
      if (value['status']) {
        exrModel = EXRModel.fromJson(value);
        emit(GetEXRSuccess());
      } else {
        showtoast(text: 'load vedio error', state: toastStates.WARRING);
        emit(GetEXRError());
      }
    }).catchError((error) {
      print('error::$error');
      emit(GetEXRError());
    });
  }
}
