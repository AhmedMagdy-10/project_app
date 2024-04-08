import 'package:flutter/material.dart';

class ProfileFeatureItemModel {
  final Color? colorsIcon;
  final Color colorsContainer;
  final IconData? featureIcon;
  final String? text;
  final void Function()? onTap;

  ProfileFeatureItemModel(
      {required this.featureIcon,
      required this.colorsIcon,
      required this.colorsContainer,
      required this.text,
      required this.onTap});
}
