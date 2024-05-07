import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/constants/icon_broken.dart';
import 'package:project_app/core/helper/cache_helper.dart';
import 'package:project_app/core/helper/show_toast_state.dart';
import 'package:project_app/design/view/login_view.dart';
import 'package:project_app/design/view/widgets/custom_button.dart';
import 'package:project_app/design/view/widgets/custom_text_form_field.dart';

import 'package:project_app/design/view/widgets/reused_form_field.dart';
import 'package:project_app/logic/cubit/main_cubit/main_cubit.dart';
import 'package:project_app/logic/cubit/main_cubit/main_states.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var ageController = TextEditingController();
    var emergencyNumController = TextEditingController();
    var genderController = TextEditingController();
    return BlocConsumer<MainCubit, MainCubitStates>(listener: (context, state) {
      if (state is UploadImageErrorState) {
        return showToast(text: state.error, state: ToastStates.error);
      }
      if (state is UploadImageSucessState) {
        return showToast(
            text: 'Update your Image Sucess', state: ToastStates.success);
      }
    }, builder: (context, state) {
      var userModel = BlocProvider.of<MainCubit>(context).userModel;
      nameController.text = userModel!.name;
      ageController.text = userModel.age;
      emailController.text = userModel.email;
      phoneController.text = userModel.phone;
      genderController.text = userModel.gender;
      emergencyNumController.text = userModel.emergencyNum;

      // var profileImage = ;
      if (userModel != null) {
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            title: const Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: SizedBox(
                      height: 200,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 68,
                                backgroundColor: Colors.grey,
                                child: CircleAvatar(
                                  radius: 67,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 63,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                        radius: 62,
                                        backgroundColor: Colors.white,
                                        child: state is! UploadImageLoadingState
                                            ? CircleAvatar(
                                                radius: 59,
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                  userModel.image,
                                                ),
                                              )
                                            : const CircularProgressIndicator(
                                                color: Colors.blue,
                                              )),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<MainCubit>(context)
                                        .getProfileImage()
                                        .then((_) {
                                      BlocProvider.of<MainCubit>(context)
                                          .upDateProfileImage();
                                    });
                                  },
                                  icon: const CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 14,
                                      child: Icon(
                                        IconBroken.Camera,
                                        color: Colors.white,
                                        size: 18,
                                      )))
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'User Information',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Text(
                              //       userModel.name,
                              //       maxLines: 1,
                              //       overflow: TextOverflow.ellipsis,
                              //       style: const TextStyle(
                              //         fontSize: 17,
                              //         fontWeight: FontWeight.w700,
                              //       ),
                              //     ),

                              //       // const Row(
                              //       //   children: [
                              //       //     SizedBox(
                              //       //       width: 5,
                              //       //     ),
                              //       //     CircleAvatar(
                              //       //       backgroundColor: Colors.blue,
                              //       //       radius: 7,
                              //       //       child: Icon(
                              //       //         Icons.check,
                              //       //         color: Colors.white,
                              //       //         size: 13,
                              //       //       ),
                              //       //     ),
                              //       //   ],
                              //       // ),
                              //   ],
                              // ),
                              // Text(
                              //   userModel.email,
                              //   maxLines: 1,
                              //   overflow: TextOverflow.ellipsis,
                              //   style: const TextStyle(
                              //     fontSize: 17,
                              //     fontWeight: FontWeight.w700,
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: nameController,
                    label: const Text('Name'),
                    prefixIcon: IconBroken.User,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    controller: ageController,
                    label: const Text('Age'),
                    prefixIcon: IconBroken.Calendar,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                      label: const Text('Email'),
                      controller: emailController,
                      prefixIcon: IconBroken.Paper),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    label: const Text('Phone'),
                    controller: phoneController,
                    prefixIcon: Icons.phone_android_outlined,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                      label: const Text('Gender'),
                      controller: genderController,
                      prefixIcon: Icons.male_outlined),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    label: const Text('Emergency Number'),
                    controller: emergencyNumController,
                    prefixIcon: IconBroken.Calling,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          IconBroken.Logout,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    onTapButton: () {
                      CacheHelper.removeData(key: 'uId').then((value) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ));
                      });

                      // exit(0);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      }
    });
  }
}
