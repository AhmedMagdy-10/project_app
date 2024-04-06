import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project_app/logic/cubit/auth_cubit/auth_states.dart';
import 'package:project_app/logic/data/models/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialState());

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                emit(SuccessLoginState(uId: value.user!.uid)),
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(FailureLoginState(errorMassage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(FailureLoginState(
            errorMassage: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(FailureLoginState(
          errorMassage: 'there was an error,please try later'));
    }
  }

//  Future<void> userLogin({
//     required String email,
//     required String password,
//   }) async {
//     emit(LoginSocialLoadingState());
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password)
//           .then((value) => {
//                 emit(
//                   LoginSocialSucessState(value.user!.uid),
//                 ),
//               });
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         emit(LoginSocialErrorState(
//             errorMessage: 'No user found for that email.'));
//       } else if (e.code == 'wrong-password') {
//         emit(LoginSocialErrorState(
//             errorMessage: 'Wrong password provided for that user.'));
//       }
//     } catch (e) {
//       emit(LoginSocialErrorState(errorMessage: e.toString()));
//     }
//   }

  Future<void> registerUser({
    required String email,
    required String password,
    required String phone,
    required String userName,
    required String age,
  }) async {
    emit(LoadingRegisterState());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        createUser(
            name: userName,
            phone: phone,
            email: email,
            uId: value.user!.uid,
            age: age);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(FailureRegisterState(
            errorMassage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(FailureRegisterState(
            errorMassage: 'الاكونت ده حد خده والله يصاحبي'));
      }
    } catch (e) {
      emit(FailureRegisterState(
          errorMassage: 'there was an error,please try later'));
    }
  }

  void createUser({
    required String name,
    required String phone,
    required String email,
    required String uId,
    required String age,
  }) {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      age: age,
      image: 'assets/images/WhatsApp Image 2024-03-14 at 23.00.08_d294abd2.jpg',
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      emit(SuccessRegisterState());
    }).catchError((error) {
      emit(FailureRegisterState(errorMassage: error.toString()));
    });
  }

  bool isSecure = true;
  IconData suffix = Icons.visibility_outlined;
  void passwordVisibility() {
    isSecure = !isSecure;
    suffix =
        isSecure ? Icons.visibility_rounded : Icons.visibility_off_outlined;
    emit(ChangePasswordShowState());
  }
}
