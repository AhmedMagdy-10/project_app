import 'dart:io';

import 'package:flutter/material.dart';

class ImageAvater extends StatelessWidget {
  const ImageAvater({
    super.key,
    this.bottomLabelText,
    this.image,
    this.networkImage,
    this.radiusOfCircle,
    // required this.model,
  });
  final String? bottomLabelText;
  final File? image;
  final String? networkImage;
  final double? radiusOfCircle;
  // final UserModel model;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const CircleAvatar(
        radius: 28,
        backgroundImage: AssetImage(
            // model.image,
            'assets/images/WhatsApp Image 2024-03-14 at 23.00.08_d294abd2.jpg'),
      ),
      const SizedBox(
        width: 15,
      ),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ahmed Magdy',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text('age ' "22",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 14, height: 1.1)),
        ],
      )),
    ]);
  }
}
