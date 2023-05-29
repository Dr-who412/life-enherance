import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/model/exr_model.dart';
import 'package:life_partner/model/todo_tasks_model.dart';
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
    if (index == 1) {
      getTodoTAsks();
    }
    if (index == 2 && exrModel == null) {
      print("gettt exr");
      // getExerciseLevel();
      getExerciseall();
    }
  }

  ///get Doctor
  List<DoctorModel> doctors = [];
  getAllDoctor() {
    print(AppConstant.Token);
    emit(GetDoctorsLoading());
    getData(
      pathUrl: AppApi.GetAllDoctor,
      token: AppConstant.Token,
    ).then((value) {
      doctors = [];
      value.forEach((element) {
        doctors.add(DoctorModel.fromJson(element));
      });
      print(value);
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

  getExerciseall() async {
    exrModel = null;
    emit(GetEXRLoading());
    await getData(
      pathUrl: AppApi.allexercises,
    ).then((value) {
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

  String VID = '';
  changeVedioId({required String vid}) {
    VID = vid;
    emit(ChangeVedioId());
  }

  ///todo to do task
  todoTaskModel? todo;
  getTodoTAsks() async {
    emit(loadingTodoState());
    await postData(pathUrl: AppApi.daily_task, token: AppConstant.Token, body: {
      'level': '2',
    }).then((value) {
      if (value['status']) {
        todo = todoTaskModel.fromJson(value);
        emit(getTodoSuccesState());
      } else {
        showtoast(text: 'load daily tasks faild', state: toastStates.WARRING);
        emit(getTodoErrorState());
      }
    }).catchError((errer) {
      showtoast(text: 'faild :$errer', state: toastStates.ERROR);
      emit(getTodoErrorState());
    });
  }
}
