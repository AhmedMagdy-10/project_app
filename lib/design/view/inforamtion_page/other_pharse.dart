import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';

class OtherPharse extends StatelessWidget {
  const OtherPharse({
    super.key,
    required this.titleOfPharse,
    required this.bodyOfPharse,
  });

  final String bodyOfPharse;
  final String titleOfPharse;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: kprimaryColor),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  titleOfPharse,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.7,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 5,
                  height: 20,
                  color: secondColor,
                ),
              ],
            ),
            Text(
              bodyOfPharse,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 15,
                height: 1.7,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
