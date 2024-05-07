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
    required String gender,
    required String emergencyNum,
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
          age: age,
          gender: gender,
          emergencyNum: emergencyNum,
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(FailureRegisterState(
            errorMassage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(FailureRegisterState(errorMassage: 'This Email Already Exist'));
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
    required String gender,
    required String emergencyNum,
  }) {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      age: age,
      gender: gender,
      emergencyNum: emergencyNum,
      image:
          'https://i.pinimg.com/564x/3d/ac/15/3dac1508432e51703ff98c091d7a221e.jpg',
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
