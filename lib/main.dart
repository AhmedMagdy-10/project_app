import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_app/constants/cache.dart';
import 'package:project_app/core/helper/cache_helper.dart';
import 'package:project_app/core/helper/dio_helper.dart';
import 'package:project_app/core/helper/observer.dart';
import 'package:project_app/design/view/splash_view.dart';
import 'package:project_app/firebase_options.dart';
import 'package:project_app/logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:project_app/logic/cubit/main_cubit/main_cubit.dart';
import 'package:project_app/logic/data/models/rate_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RateModelAdapter());
  await Hive.openBox<RateModel>('RateModelBox');
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = Observer();
  await CacheHelper.init();
  uId = await CacheHelper.getSaveData(key: 'uId');

  // print(uId);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
  Bloc.observer = Observer();
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

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
        home: const SplashView(),
      ),
    );
  }
}
