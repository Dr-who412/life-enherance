import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as fireStorag;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:life_partner/model/auth_model/google_model.dart';
import 'package:life_partner/model/meal.dart';
import 'package:life_partner/model/question_model.dart';
import 'package:life_partner/model/weakly_diet.dart';
import 'package:life_partner/module/authScreen/sign_cubit/sign_state.dart';
import 'package:life_partner/shared/componant/constant.dart';
import 'package:life_partner/shared/network/api.dart';
import 'package:life_partner/shared/network/httpHelper.dart';

import '../../../model/auth_model/user.dart';
import '../../../shared/componant/componant.dart';
import '../../../shared/shared_preference/cachHelper.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit() : super(InitSignState());
  static SignCubit get(context) => BlocProvider.of(context);
  zero() {
    emit(zeroState());
  }

  UserCredential? userGoogle;
  UserGoogle? googleUserData;
  Future signInGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = await GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    userGoogle = await FirebaseAuth.instance.signInWithCredential(credential);

    print(userGoogle);
    print(userGoogle?.user);
    emit(SigningGoogleState());
    LoginWithGoogleToServer();
  }

  bool isVisable = false;
  changePasswordVisability() {
    isVisable = !isVisable;
    emit(ChangeVisableState());
  }

  LoginWithGoogleToServer() async {
    emit(SignInLoadingState());

    await postData(
      pathUrl: AppApi.gmailAuth,
      body: {
        "email": "${userGoogle?.user?.email}",
        "emailVerified": "${userGoogle?.user?.emailVerified ?? false}",
        "displayName": "${userGoogle?.user?.displayName}",
        "photoURL": "${userGoogle?.user?.photoURL}",
      },
    ).then((value) {
      print('###########$value');
      if (value['status']) {
        AppConstant.Token = value['token'];
        CacheHelper.saveData(
          key: 'token',
          value: '${value['token']}',
        ).then((va) {
          user = UserModel.fromJson(value);
          print('get user success :::${user?.user?.name}');
          if (value['isNew']) {
            emit(SignInWithGooglFirstTime());
          }
          if (!value['isNew']) {
            emit(SignInWithGooglOld());
          }
          showtoast(text: 'hi ${user?.user?.name}', state: toastStates.SUCESS);
        });
      } else {
        showtoast(text: 'error: ${value['message']}', state: toastStates.ERROR);
        emit(SignInErrorState());
      }
    }).catchError((error) {
      print('###########');
      print(error.toString());
      showtoast(text: 'error: ${error.toString()}', state: toastStates.ERROR);
      emit(SignInErrorState());
    });
  }

  ///signup to server
  UserModel? user;
  singUp(
      {required String email,
      required String name,
      required String password}) async {
    emit(SignInLoadingState());
    postData(pathUrl: AppApi.Signup, body: {
      "email": email,
      "userpassword": password,
      "name": name,
    }).then((value) {
      print('###########$value');
      if (value['status']) {
        user = UserModel.fromJson(value);
        CacheHelper.saveData(
          key: 'token',
          value: '${value['token']}',
        ).then((va) {
          AppConstant.Token = value['token'];
          emit(SignInSuccessState());
          showtoast(text: 'hi ${user?.user?.name}', state: toastStates.SUCESS);
        });
      } else {
        emit(SignInErrorState());
      }
    }).catchError((error) {
      print('###########');
      print(error.toString());
      showtoast(text: 'error: ${error.toString()}', state: toastStates.ERROR);
      emit(SignInErrorState());
    });
  }

  logIn({required String email, required String password}) {
    emit(LogInLoadingState());
    postData(pathUrl: AppApi.Login, body: {
      'email': email,
      'password': password,
    }).then((value) {
      if (value['status'] == true) {
        AppConstant.Token = value['token'];
        CacheHelper.saveData(
          key: 'token',
          value: '${AppConstant.Token}',
        ).then((vl) {
          user = UserModel.fromJson(value);
          showtoast(text: 'hi ${user?.user?.name}', state: toastStates.SUCESS);
          emit(LogInSuccessState());
        });
      } else {
        emit(LogInErrorState());
      }
    }).catchError((error) {
      showtoast(text: 'error: ${error.toString()}', state: toastStates.ERROR);
      print(error.toString());
      emit(LogInErrorState());
    });
  }

  logOut() {
    CacheHelper.removedata(key: 'token').then((value) {
      user = null;
      AppConstant.Token = '';
      emit(LogoutState());
    });
  }

  getUserData() {
    print("cccccccccccccccccccccccccccccc");
    print("${AppConstant.Token}");
    getData(
      pathUrl: AppApi.GetUser,
      token: AppConstant.Token,
    ).then((value) {
      print("ccccccc $value cccccccc");
      if (value['status']) {
        user = UserModel.fromJson(value);
        emit(GetUserDataSucces());
        print('===============>$user');
        getWeaklyDietDaily();
      } else {
        showtoast(text: 'faild load user data', state: toastStates.ERROR);
      }
    }).catchError((error) {
      emit(faildgetUser());
      // AppConstant.Token = '';
      // CacheHelper.removedata(key: 'token');
      // showtoast(text: 'error when load user data', state: toastStates.ERROR);
    });
  }

  File? profileImage;
  final ImagePicker picker = ImagePicker();
  String? profileUrl;
  // void removeChatImage(){
  //   chatImage=null;
  //   emit(RenmovePickedChatImage());
  // }
  Future<void> pickImage() async {
    final pickFile = await picker.getImage(source: ImageSource.gallery);
    if (pickFile != null) {
      profileImage = File(pickFile.path);
      print(pickFile.path);
      emit(PickImageSuccess());
    } else {
      print("No Image selected");
      emit(PickError());
    }
  }

  void uploadImage() {
    fireStorag.FirebaseStorage.instance
        .ref()
        .child('Images/${Uri.file("${profileImage?.path}").pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print("image url :: $value");
        profileUrl = value;
        emit(UploadChatImageSuccess());
      }).catchError((error) {
        emit(UploadChatImageError());
      });
    }).catchError((error) {
      print("upload image error: ${error.toString()}");
      emit(UploadChatImageError());
    });
  }

  int? BMI;
  int? height;
  int? weight;
  int? age;
  bool? isMale;
  void updateDate() {
    postData(pathUrl: AppApi.UpdateUser, body: {
      "email": "${user?.user?.email}",
      "BMI": '$BMI',
      "height": "$height",
      "weight": "$weight",
      "age": "$age",
      "gender": isMale == true ? "male" : 'female',
      "userAbility": '1',
      "diet": "$WeeklyName",
      "PhotoURL": "${profileUrl ?? user?.user?.photoURL}"
    }).then((value) {
      if (value['status'] == true) {
        user = UserModel.fromJson(value['user']);
        showtoast(text: 'updated Successfully', state: toastStates.SUCESS);
        emit(UpdateUSerSuccessState());
      }
      print(value);
    }).catchError((error) {
      showtoast(text: 'failed update', state: toastStates.WARRING);
      print(error.toString());
    });
  }

  bool showDrower = false;
  ShowDrawer() {
    showDrower = !showDrower;
    emit(ShowDrawerState());
  }

  List Answer = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List Ques = [
    'Are You allergic from Gluten ?',
    'Are you trying to lose weight or improve your overall health ?',
    'Are you highly active ?',
    'Do you prefer to eat meat, fish, or no animal products at all ?',
    'Are you willing to give up certain foods, such as eggs?',
    'Are you willing to give up certain foods, such as dairy products ?',
    'are you willing to give up grains ?',
  ];
  ChangeAnswer({required bool answer, required int quIndex}) {
    Answer[quIndex] = answer;
    emit(ChangeAnswerState());
  }

  String WeeklyId = '';
  String WeeklyName = '';
  sendAnswer() async {
    emit(SendAnsLoadingState());
    await getData(
        pathUrl: AppApi.select_diet,
        token: AppConstant.Token,
        query: {
          'hasAllergies': Answer[0],
          'wantsToLoseWeight': Answer[1],
          'isLightlyActive': !Answer[2],
          'isVeryActive': Answer[2],
          'isVegetarian': !Answer[3],
          'eatsEggs': Answer[4],
          'eatsMilk': Answer[5],
          'isWillingToGiveUpGrains': Answer[6],
        }).then((value) {
      print(value);
      if (value['status']) {
        WeeklyId = value['diet'][0]['_id'];
        WeeklyName = value['diet'][0]['name'];
        emit(SendAnsSuccessState());
      } else {
        print(value);
        emit(SendAnsFaildState());
      }
    }).catchError((error) {
      print(error);
      emit(SendAnsFaildState());
    });
  }

  WeeklyDiet? weeklyDiet;
  getWeeklyDiet() async {
    emit(getWeeklyLoadingDiet());
    await getData(
      pathUrl: AppApi.weeklyDiet,
      token: AppConstant.Token,
    ).then((value) {
      print(value);
      if (value['status']) {
        weeklyDiet = WeeklyDiet.fromJson(value);
        emit(getWeeklyDietSuccess());
      } else {
        emit(getWeeklyDietError());
      }
    }).catchError((error) {
      print('$error');
      emit(getWeeklyDietError());
    });
  }

  Day? dayMeal;
  days? today;
  String? currentDay;
  getWeaklyDietDaily() async {
    emit(getWeeklyLoadingDiet());
    await getData(
        pathUrl: AppApi.dietweekid,
        token: AppConstant.Token,
        query: {'id': '${user?.user?.dietPlan}'}).then((value) {
      print(value);
      if (value['status']) {
        weeklyDiet = WeeklyDiet.fromJson(value);
        print(DateTime.now().weekday);
        switch (DateTime.now().weekday) {
          case 0:
            today = days.sunday;
            dayMeal =
                Day.fromJson(value['diet']['description']['week']['sunday']);
            break;
          case 1:
            today = days.monday;
            dayMeal =
                Day.fromJson(value['diet']['description']['week']['monday']);

            break;
          case 2:
            today = days.tuesday;
            dayMeal =
                Day.fromJson(value['diet']['description']['week']['tuesday']);
            break;

          case 3:
            today = days.wednesday;
            dayMeal =
                Day.fromJson(value['diet']['description']['week']['wednesday']);

            break;
          case 4:
            today = days.thursday;
            dayMeal =
                Day.fromJson(value['diet']['description']['week']['thursday']);

            break;
          case 5:
            today = days.friday;
            dayMeal =
                Day.fromJson(value['diet']['description']['week']['friday']);

            break;
          case 6:
            today = days.saturday;
            dayMeal =
                Day.fromJson(value['diet']['description']['week']['saturday']);

            break;
          case 7:
            today = days.monday;
            dayMeal =
                Day.fromJson(value['diet']['description']['week']['monday']);

            break;
        }
        print(today);
        currentDay = '$today'.split('.')[1];
        print(currentDay);

        emit(getWeeklyDietSuccess());
      } else {
        emit(getWeeklyDietError());
      }
    }).catchError((error) {
      print('$error');
      emit(getWeeklyDietError());
    });
  }

  Mail? mail;
  getMealById({required String mealId}) async {
    mail = null;
    emit(getMealLoadingDiet());
    await getDataByUrl(
      Url:
          'https://api.spoonacular.com/recipes/${mealId}/information?apiKey=261fdba0020c42e6bfc2b28449907233',
    ).then((value) {
      mail = Mail.fromJson(value);
      print(mail);
      emit(getMealDietSuccess());
    }).catchError((error) {
      print('$error');
      emit(getWeeklyDietError());
    });
  }

  int? choosedMeals;

  DisorderQuestion? disorderModel;
  getQuestions() async {
    emit(getDisoredrLodaing());
    await getData(
      pathUrl: AppApi.disorder,
      token: AppConstant.Token,
    ).then((value) {
      print(value);
      if (value['status']) {
        emit(getDisoredrSuccess());
        disorderModel = DisorderQuestion.fromJson(value);
      } else {
        emit(getDisoredrError());
      }
    }).catchError((error) {
      print(error);
      emit(getDisoredrError());
    });
  }

  List disorderAns = [];
  int totalDisorder = 0;
  setDisorderAns(int index, int value) {
    print(disorderAns);
    totalDisorder = 0;
    disorderAns[index] = value;
    print(disorderAns);
    disorderAns.forEach((element) {
      totalDisorder = totalDisorder + int.parse('$element');
    });
    print('${totalDisorder}');
  }

  postDisorderResult() async {
    emit(sendDisorderLoading());

    await postData(
            pathUrl: AppApi.resultDisorder,
            body: {
              'result':
                  '${totalDisorder / (3 * (disorderModel?.questions?.length.toInt() ?? 1))}'
            },
            token: AppConstant.Token)
        .then((value) {
      print('$value');
      emit(sendDisorderSucccess());
    }).catchError((error) {
      emit(sendDisorderError());
      print(error);
    });
  }
}

enum days { sunday, monday, tuesday, wednesday, thursday, friday, saturday }
