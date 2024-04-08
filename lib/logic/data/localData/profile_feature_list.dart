import 'package:flutter/material.dart';
import 'package:project_app/constants/icon_broken.dart';
import 'package:project_app/logic/data/models/profile_model.dart';

List<ProfileFeatureItemModel> featureColorsContainer = [
  ProfileFeatureItemModel(
    featureIcon: IconBroken.User1,
    colorsIcon: Colors.white,
    colorsContainer: Colors.blue,
    text: 'Toxic team',
    onTap: () {},
  ),
  ProfileFeatureItemModel(
    featureIcon: IconBroken.Heart,
    colorsIcon: Colors.white,
    colorsContainer: const Color(0xffD9D9D9),
    text: 'Tell a Friend',
    onTap: () {},
  ),
  ProfileFeatureItemModel(
    featureIcon: Icons.question_answer,
    colorsIcon: Colors.white,
    colorsContainer: const Color(0xffFD9F12),
    text: 'FeedBack',
    onTap: () {},
  ),
  ProfileFeatureItemModel(
    featureIcon: IconBroken.User1,
    colorsIcon: Colors.white,
    colorsContainer: const Color(0xffFD9F12),
    text: 'Privacy & Policy',
    onTap: () {},
  ),
  ProfileFeatureItemModel(
    featureIcon: IconBroken.Info_Circle,
    colorsIcon: Colors.white,
    colorsContainer: const Color(0xffF44545),
    text: 'Help For App',
    onTap: () {},
  ),
];
