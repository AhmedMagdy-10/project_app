import 'package:flutter/material.dart';
import 'package:project_app/logic/data/models/on_boarding_model.dart';

class BuildOnBoardingItem extends StatelessWidget {
  const BuildOnBoardingItem({
    super.key,
    required this.model,
  });
  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(model.image),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          model.title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          model.subTitle,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.grey[300],
              ),
        )
      ],
    );
  }
}
