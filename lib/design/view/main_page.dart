import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/constants/icon_broken.dart';
import 'package:project_app/logic/cubit/main_cubit/main_cubit.dart';
import 'package:project_app/logic/cubit/main_cubit/main_states.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainCubitStates>(builder: (context, state) {
      return Scaffold(
        body: BlocProvider.of<MainCubit>(context)
            .views[BlocProvider.of<MainCubit>(context).currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            selectedItemColor: kprimaryColor,
            onTap: (index) {
              BlocProvider.of<MainCubit>(context).changeView(index);
              print(index);
            },
            currentIndex: BlocProvider.of<MainCubit>(context).currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Chart,
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Chat),
                label: 'ChatBot',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
            ]),
      );
    });
  }
}
