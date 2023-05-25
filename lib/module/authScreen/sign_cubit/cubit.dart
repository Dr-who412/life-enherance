import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as fireStorag;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:life_partner/model/auth_model/google_model.dart';
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
          value: '${AppConstant.Token}',
        ).then((va) {
          user = UserModel.fromJson(value['user']);
          print('get user success :::${user?.name}');
          if (value['isNew']) {
            emit(SignInWithGooglFirstTime());
          }
          if (!value['isNew']) {
            emit(SignInWithGooglOld());
          }
          showtoast(text: 'hi ${user?.name}', state: toastStates.SUCESS);
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
      if (value['user'] != null) {
        AppConstant.Token = value['token'];
        CacheHelper.saveData(
          key: 'token',
          value: '${AppConstant.Token}',
        ).then((va) {
          user = UserModel.fromJson(value['user']);
          print('get user success :::${user?.name}');
          emit(SignInSuccessState());
          showtoast(text: 'hi ${user?.name}', state: toastStates.SUCESS);
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
          user = UserModel.fromJson(value['user']);
          showtoast(text: 'hi ${user?.name}', state: toastStates.SUCESS);
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
      emit(LogoutState());
      user = null;
    });
  }

  getUserData() {
    getData(
      pathUrl: AppApi.GetUser,
      token: AppConstant.Token,
    ).then((value) {
      if (value['status'] == true) {
        user = UserModel.fromJson(value['user']);
        showtoast(text: 'hi ${user?.name}', state: toastStates.SUCESS);
        emit(GetUserDataSucces());
      } else {
        showtoast(text: 'faild load user data', state: toastStates.ERROR);
      }
    }).catchError((error) {
      showtoast(text: 'error when load user data', state: toastStates.ERROR);
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

  void updateDate(
      {required int? BMI,
      required int? height,
      required int? weight,
      bool isMale = true}) {
    postData(pathUrl: AppApi.UpdateUser, token: AppConstant.Token, body: {
      "email": "${user?.email}",
      "BMI": '$BMI',
      "height": "$height",
      "weight": "$weight",
      'gender': isMale ? 'male' : 'female',
      "PhotoURL": "${profileUrl ?? user?.image}"
    }).then((value) {
      if (value['status'] == true) {
        user = UserModel.fromJson(value['user']);
        showtoast(text: 'updated Successfully', state: toastStates.SUCESS);
        emit(UpdateUSerSuccessState());
      }
    }).catchError((error) {
      showtoast(text: 'failed update', state: toastStates.WARRING);
      print(error.toString());
    });
  }
}
