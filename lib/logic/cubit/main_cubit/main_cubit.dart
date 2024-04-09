import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_app/constants/cache.dart';
import 'package:project_app/core/helper/cache_helper.dart';
import 'package:project_app/core/helper/show_toast_state.dart';
import 'package:project_app/design/view/chat_view.dart';
import 'package:project_app/design/view/history_view.dart';
import 'package:project_app/design/view/measure_view.dart';
import 'package:project_app/design/view/profile_view.dart';
import 'package:project_app/logic/cubit/main_cubit/main_states.dart';
import 'package:project_app/logic/data/models/user_model.dart';

class MainCubit extends Cubit<MainCubitStates> {
  MainCubit() : super(MainInitailStates());

  UserModel? userModel;

  Future<void> getUserData() async {
    uId = CacheHelper.getSaveData(key: 'uId');
    emit(MainLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(MainSuccessState());
    }).catchError((error) {
      emit(MainErrorState(errorMassage: error.toString()));
    });
  }

  int currentIndex = 0;

  List<String> title = [
    'Home',
    'History',
    'ChatBot',
    'Profile',
  ];

  List<Widget> views = [
    const MeasureView(),
    const HistoryView(),
    const ChatBot(),
    const ProfileView(),
  ];

  void changeView(int index) {
    currentIndex = index;
    emit(ChangePages());
  }

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);

      emit(GetProfileImageSuccess());
      print(pickedFile.path);
    } else {
      print('No image selected');
      emit(GetProfileImageFailed());
    }
  }

  void upDateProfileImage({
    String? image,
  }) {
    emit(UploadImageLoadingState());
    if (profileImage != null) {
      FirebaseStorage.instance
          .ref()
          .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
          .putFile(profileImage!)
          .then((value) {
        value.ref.getDownloadURL().then((value) {
          updateUser(image: value);
          emit(UploadImageSucessState());
        }).catchError((error) {
          showToast(text: error.toString(), state: error);
          emit(UploadImageErrorState(error.toString()));
          print(error.toString());
        });
      }).catchError((error) {
        emit(UploadImageErrorState(error.toString()));
        print('error = ${error.toString()}');
      });
    }
  }

  void updateUser({String? image}) {
    UserModel model = UserModel(
        name: userModel!.name,
        email: userModel!.email,
        phone: userModel!.phone,
        uId: userModel!.uId,
        image: image ?? userModel!.image,
        age: userModel!.age);
    emit(UpdateUserDataLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
      emit(UpdateUserDataSuccess());
    }).catchError((error) {
      emit(UpdateUserDataError(error: error.toString()));
    });
  }
}
