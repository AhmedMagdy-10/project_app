import 'package:flutter/material.dart';
import 'package:project_app/logic/data/models/massage_model.dart';

class ContentOfMessage extends StatelessWidget {
  const ContentOfMessage(
      {super.key,
      this.color,
      this.borderRaduis,
      required this.alignment,
      required this.model});

  final Color? color;
  final BorderRadiusGeometry? borderRaduis;
  final AlignmentGeometry alignment;

  final MassageModel model;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRaduis,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              model.massage,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              model.dateTime,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
