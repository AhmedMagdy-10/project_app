import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/constants/cache.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/core/helper/cache_helper.dart';
import 'package:project_app/core/helper/dio_helper.dart';
import 'package:project_app/core/helper/observer.dart';
import 'package:project_app/design/view/chat_view.dart';
import 'package:project_app/design/view/login_view.dart';
import 'package:project_app/design/view/main_page.dart';
import 'package:project_app/design/view/measure_view.dart';
import 'package:project_app/design/view/register_view.dart';
import 'package:project_app/design/view/splash_view.dart';
import 'package:project_app/firebase_options.dart';
import 'package:project_app/logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:project_app/logic/cubit/main_cubit/main_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = Observer();
  await CacheHelper.init();
  uId = await CacheHelper.getSaveData(key: 'uId');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(
    uId: uId,
  ));
  Bloc.observer = Observer();
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.uId,
  });

  final String? uId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(
          create: (BuildContext context) => MainCubit()..getUserData(),
        ),
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Cairo',
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
          home: uId == null ? const LoginView() : const MainPage()),
    );
  }
}
