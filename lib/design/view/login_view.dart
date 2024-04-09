import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/constants/icon_broken.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/constants/validator.dart';
import 'package:project_app/core/helper/cache_helper.dart';
import 'package:project_app/core/helper/show_toast_state.dart';
import 'package:project_app/design/view/main_page.dart';
import 'package:project_app/design/view/register_view.dart';
import 'package:project_app/design/view/widgets/custom_button.dart';
import 'package:project_app/design/view/widgets/custom_text_form_field.dart';
import 'package:project_app/logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:project_app/logic/cubit/auth_cubit/auth_states.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          CacheHelper.saveData(key: 'uId', value: state.uId);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
              (route) => false);
          return showToast(text: 'Success', state: ToastStates.success);
        } else if (state is FailureLoginState) {
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
                height: 300,
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
                    height: 180,
                    width: 180,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login Now...',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.8,
                          color: Colors.black),
                    ),
                    Text(
                        'Login and continue recording your heartbeats ,To take care your health',
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
                          suffIcon: BlocProvider.of<AuthCubit>(context).suffix,
                          secure: BlocProvider.of<AuthCubit>(context).isSecure,
                          onPressedSuffixIcon: () {
                            BlocProvider.of<AuthCubit>(context)
                                .passwordVisibility();
                          },
                          prefixIcon: IconBroken.Lock,
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
                          height: 30,
                        ),
                        CustomButton(
                            child: state is LoadingLoginState
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Login',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                  ),
                            onTapButton: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context).signInUser(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return const RegisterView();
                                  },
                                ), (route) => false);
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(color: secondColor),
                              ),
                            ),
                          ],
                        ),
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
