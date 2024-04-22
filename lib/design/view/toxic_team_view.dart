import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/logic/cubit/main_cubit/main_cubit.dart';
import 'package:project_app/logic/cubit/main_cubit/main_states.dart';
import 'package:project_app/logic/data/models/user_model.dart';

class ToxicTeamView extends StatelessWidget {
  const ToxicTeamView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
        create: (context) => MainCubit()..getAllTeam(),
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            title: const Text(
              'Work Team',
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.all(16),
            child: ListTeamMemmber(),
          ),
        ));
  }
}

class TeamMemmberFeature extends StatelessWidget {
  const TeamMemmberFeature({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 55,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 53.5,
            child: CircleAvatar(
              radius: 51,
              backgroundImage: CachedNetworkImageProvider(userModel.image),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  userModel.name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (userModel.name == 'Ahmed Magdy')
                  const Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 7,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 13,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            if (userModel.name == 'Ahmed Magdy' ||
                userModel.name == 'Mohamed Hussien')
              const Text(
                'Flutter Developer',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            if (userModel.name == 'Hossam Ahmed' ||
                userModel.name == 'Rawan Ammer')
              const Text(
                'UI Designer',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            if (userModel.name == 'Gaber Ezzat' ||
                userModel.name == 'Hagar Saleh')
              const Text(
                'Hardware',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            if (userModel.name == 'Dr Noahman' ||
                userModel.name == 'Noahman Mohmed')
              const Text(
                'Supervisor',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class ListTeamMemmber extends StatelessWidget {
  const ListTeamMemmber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainCubitStates>(builder: (context, state) {
      if (state is! LoadingUser) {
        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            shrinkWrap: true,
            itemBuilder: (context, index) => TeamMemmberFeature(
                  userModel: BlocProvider.of<MainCubit>(context).team[index],
                ),
            separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 1.5,
                    width: MediaQuery.sizeOf(context).width,
                    color: Colors.grey,
                  ),
                ),
            itemCount: BlocProvider.of<MainCubit>(context).team.length);
      } else {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.blue,
        ));
      }
    });
  }
}
