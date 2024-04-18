import 'package:flutter/material.dart';
import 'package:project_app/logic/data/models/info_data.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.containerModel});

  final InformatoinContainerModel containerModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: containerModel.onTap,
      child: Container(
        height: 220,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: containerModel.color),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                containerModel.image,
                width: 100,
                height: 130,
              ),
              Text(
                containerModel.text,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
