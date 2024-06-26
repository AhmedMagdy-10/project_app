import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_app/logic/data/models/user_model.dart';

class ImageAvater extends StatelessWidget {
  const ImageAvater({
    super.key,
    this.bottomLabelText,
    this.image,
    this.networkImage,
    this.radiusOfCircle,
    required this.model,
  });
  final String? bottomLabelText;
  final File? image;
  final String? networkImage;
  final double? radiusOfCircle;
  final UserModel model;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(
        radius: 32,
        backgroundImage: CachedNetworkImageProvider(model.image),
      ),
      const SizedBox(
        width: 15,
      ),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                model.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (model.name == 'Ahmed Magdy')
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
          Text(
            'age ' "${model.age}",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 14, height: 1.1),
          ),
        ],
      )),
    ]);
  }
}
