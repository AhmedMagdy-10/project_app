import 'package:flutter/material.dart';
import 'package:project_app/constants/icon_broken.dart';
import 'package:project_app/design/view/toxic_team_view.dart';
import 'package:project_app/logic/data/localData/profile_feature_list.dart';
import 'package:project_app/logic/data/models/profile_model.dart';

class ProfileFeatureItem extends StatelessWidget {
  const ProfileFeatureItem({super.key, required this.model});

  final ProfileFeatureItemModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: model.colorsContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                model.featureIcon,
                color: model.colorsIcon,
                size: 35,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              model.text!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xffA1A1A1),
              ),
            ),
          ),
          const Icon(
            IconBroken.Arrow___Right_Circle,
            size: 30,
            color: Color(0xffA1A1A1),
          ),
        ],
      ),
    );
  }
}

class FeatureItemList extends StatelessWidget {
  const FeatureItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ToxicTeamView();
              },
            ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    IconBroken.User1,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Expanded(
                child: Text(
                  'Toxic Team',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffA1A1A1),
                  ),
                ),
              ),
              const Icon(
                IconBroken.Arrow___Right_Circle,
                size: 30,
                color: Color(0xffA1A1A1),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProfileFeatureItem(
                model: featureItem[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
            itemCount: featureItem.length),
      ],
    );
  }
}
