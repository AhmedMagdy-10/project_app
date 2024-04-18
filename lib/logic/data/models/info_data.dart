import 'package:flutter/material.dart';

class InformatoinContainerModel {
  final String text;
  final String image;
  final Color? color;
  final void Function() onTap;

  InformatoinContainerModel(
      {required this.onTap,
      required this.text,
      required this.image,
      required this.color});
}
