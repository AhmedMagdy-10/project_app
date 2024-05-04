import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_app/constants/cache.dart';
import 'package:project_app/core/helper/cache_helper.dart';
import 'package:project_app/core/helper/dio_helper.dart';
import 'package:project_app/core/helper/show_toast_state.dart';
import 'package:project_app/design/view/chat_view.dart';
import 'package:project_app/design/view/history_view.dart';
import 'package:project_app/design/view/inforamtion_view.dart';
import 'package:project_app/design/view/map_page.dart';
import 'package:project_app/design/view/measure_view.dart';
import 'package:project_app/design/view/profile_view.dart';
import 'package:project_app/logic/cubit/main_cubit/main_states.dart';
import 'package:project_app/logic/cubit/map_cubit/map_cubit.dart';
import 'package:project_app/logic/data/models/user_model.dart';
import 'package:project_app/logic/data/repository/map_repo.dart';
import 'package:project_app/logic/data/webservices/places_web_services.dart';

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

  // static void sendNotificationPeriodically() {
  //   // Send the first notification immediately
  //   sentNotification();

  //   // Schedule the next notification to be sent after 2 hours (7200 seconds)
  //   Timer.periodic(const Duration(seconds: 10), (timer) {
  //     sentNotification();
  //   });
  // }

  // static sentNotification() async {
  //   final body = {
  //     'to':
  //         'ePac5gmvT9uoCuOLc5bYE3:APA91bGNNO2P_lfK13ackcqzrWgHSxp7Aj-F_wHbj2HgIpeeK4zSApion8aoqJzvbdPA3Eu9mijlQcaO840Fm7Kh8WNSKX1YZx6FySy6dfiSJFwrXlJjL1PAxU4oQjsFgipmm4LiEZ94',
  //     "notification": {
  //       "title": "Heart Rate",
  //       "body": "Remember when to take your heart rate for your safety",
  //     }
  //   };

  //   final response = await DioHelper().postDate(
  //       url: 'https://fcm.googleapis.com/fcm/send',
  //       data: body,
  //       token:
  //           'key=AAAASoIoaeA:APA91bHqLMEwR4wSbzRTZ8K7gMnVaG1Z1-96Rcl2gEQ-DQEIBBnHbrlg1uOe51MMa8qLKjGljC0ixOxzXHDrViyxOHApn2TbC_ZHqjo5wph9-mmigv4kS7dis6u1D7_A3HfFzCGSurEK');

  //   print(response.statusCode);
  // }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void sendNotification() async {
    String? deviceToken = await _firebaseMessaging.getToken();

    final body = {
      'to':
          'fez0OivTRNG1yCzt37xBmR:APA91bHcISyj7d74EfKSzSvFXolOt1akUAtlg5P2FNCrEzCU6R5SsLy2BIfWranpu1XsPmUEw8k-Hd4TY8Xl1EEL0UOe8l_nXxwN5a0BalFb0-b_U1UVwp3JSDmoK01sUGVhU6EHJfeb',
      'notification': {
        'title': userModel!.name,
        'body': 'thank you for using our app ',
      },
    };

    final response = await DioHelper().postDate(
      url: 'https://fcm.googleapis.com/fcm/send',
      data: body,
      token:
          'key=AAAASoIoaeA:APA91bHqLMEwR4wSbzRTZ8K7gMnVaG1Z1-96Rcl2gEQ-DQEIBBnHbrlg1uOe51MMa8qLKjGljC0ixOxzXHDrViyxOHApn2TbC_ZHqjo5wph9-mmigv4kS7dis6u1D7_A3HfFzCGSurEK',
    );
    print(deviceToken);
    print(response.statusCode);
  }

  int currentIndex = 0;

  List<String> title = [
    'Home',
    'Inforamtion',
    'ChatBot',
    'History',
    'Profile',
  ];

  List<Widget> views = [
    const MeasureView(),
    const InformationView(),
    const ChatBot(),
    BlocProvider<GoogleMapCubit>(
      create: (context) =>
          GoogleMapCubit(MapRepository(placesMapServices: PlacesMapServices())),
      child: const GoogleMapView(),
    ),
    const HistoryView(),
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

  List<UserModel> team = [];

  void getAllTeam() {
    emit(LoadingUser());
    if (team.isEmpty) {
      FirebaseFirestore.instance.collection('users').get().then((value) {
        for (var i = 0; i < value.docs.length; i++) {
          team.add(UserModel.fromJson(value.docs[i].data()));
          emit(UserSuccess());
        }
      }).catchError((error) {
        emit(UserError(error: error));
      });
    }
  }
}
