import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';

class PharseOne extends StatelessWidget {
  const PharseOne({super.key, required this.pharseOneTitle});
  final String pharseOneTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: kprimaryColor),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          pharseOneTitle,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 15,
            height: 1.7,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
