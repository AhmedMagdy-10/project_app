import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/constants/icon_broken.dart';
import 'package:project_app/constants/validator.dart';
import 'package:project_app/core/helper/show_toast_state.dart';
import 'package:project_app/design/view/login_view.dart';
import 'package:project_app/design/view/widgets/custom_button.dart';
import 'package:project_app/design/view/widgets/custom_text_form_field.dart';
import 'package:project_app/logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:project_app/logic/cubit/auth_cubit/auth_states.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController userController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController emergencyNumController =
        TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessRegisterState) {
          showToast(
              text: 'Create Account Successflly,login Now',
              state: ToastStates.success);
          Navigator.pop(context);
        } else if (state is FailureRegisterState) {
          return showToast(text: state.errorMassage, state: ToastStates.error);
        }
      },
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: kprimaryColor,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/heart11.gif',
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up Now...',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.8,
                          color: Colors.black),
                    ),
                    Text(
                        'To measures your heart rate accuracy and efficiency ,and take care your health',
                        // ,and you will enjoy many others features that you will find it in our app',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.grey)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextFormField(
                          keyboardType: TextInputType.name,
                          prefixIcon: IconBroken.User1,
                          controller: userController,
                          hintText: 'enter your name',
                          validator: (data) {
                            return validatorInput(
                                data!, userController.text, 5, 50);
                          },
                          label: const Text(
                            'User name',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.phone,
                          prefixIcon: Icons.date_range_outlined,
                          controller: ageController,
                          hintText: 'Enter your age',
                          validator: (data) {
                            return validatorInput(
                                data!, passwordController.text, 1, 3);
                          },
                          label: const Text(
                            'Age',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.email,
                          controller: emailController,
                          hintText: 'enter your email',
                          validator: (data) {
                            return validatorInput(
                                data!, emailController.text, 5, 50);
                          },
                          label: const Text(
                            'Email',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          hintText: 'Enter your password',
                          prefixIcon: IconBroken.Lock,
                          secure: BlocProvider.of<AuthCubit>(context).isSecure,
                          suffIcon: BlocProvider.of<AuthCubit>(context).suffix,
                          onPressedSuffixIcon: () {
                            BlocProvider.of<AuthCubit>(context)
                                .passwordVisibility();
                          },
                          controller: passwordController,
                          validator: (data) {
                            return validatorInput(
                                data!, passwordController.text, 5, 50);
                          },
                          label: const Text(
                            'Password',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.phone,
                          prefixIcon: Icons.phone_android_outlined,
                          controller: phoneController,
                          hintText: 'enter your phone',
                          validator: (data) {
                            return validatorInput(
                                data!, passwordController.text, 11, 12);
                          },
                          label: const Text(
                            'Phone number',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.text,
                          prefixIcon: Icons.merge_type_rounded,
                          controller: genderController,
                          hintText: 'enter your gender',
                          validator: (data) {
                            return validatorInput(
                                data!, passwordController.text, 4, 60);
                          },
                          label: const Text(
                            'Gender',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.phone,
                          prefixIcon: IconBroken.Calling,
                          suffIcon: IconBroken.Danger,
                          suffIconColor: Colors.red,
                          controller: emergencyNumController,
                          hintText: 'enter Emergency Number',
                          validator: (data) {
                            return validatorInput(
                                data!, passwordController.text, 11, 12);
                          },
                          label: const Text(
                            'Emergency number',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          onTapButton: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).registerUser(
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                                userName: userController.text,
                                age: ageController.text,
                                gender: genderController.text,
                                emergencyNum: emergencyNumController.text,
                              );
                            }
                          },
                          child: state is LoadingRegisterState
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Sign Up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'I have an account ?',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginView();
                                  },
                                ), (route) => false);
                              },
                              child: const Text(
                                'Login ',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                        const Text('Or Sign Up with',
                            style: TextStyle(color: Colors.black)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blue,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.instagram,
                                color: Colors.red,
                                size: 26,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.google,
                                color: Colors.blue,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesomeIcons.xTwitter,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
