import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/constants/cache.dart';
import 'package:project_app/core/helper/cache_helper.dart';
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
}
