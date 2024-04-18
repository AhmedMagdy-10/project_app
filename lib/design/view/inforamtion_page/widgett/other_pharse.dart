import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';

class OtherPharse extends StatelessWidget {
  const OtherPharse({
    super.key,
    this.titleOfPharse,
    this.bodyOfPharse,
  });

  final String? bodyOfPharse;
  final String? titleOfPharse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                titleOfPharse ?? "_",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.7,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              if (titleOfPharse != "_")
                Container(
                  width: 5,
                  height: 20,
                  color: secondColor,
                ),
            ],
          ),
          Text(
            bodyOfPharse ?? '',
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 15,
              height: 1.7,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
