import 'package:flutter/material.dart';
import 'package:project_app/design/view/inforamtion_page/what_heart_rate.dart';
import 'package:project_app/design/view/widgets/custom_card.dart';
import 'package:project_app/logic/data/models/info_data.dart';

class CardListData extends StatelessWidget {
  const CardListData({super.key});

  @override
  Widget build(BuildContext context) {
    final List<InformatoinContainerModel> cardData = [
      InformatoinContainerModel(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WhatHeartRate(),
              ));
        },
        text: 'ما هو معدل نبضات القلب',
        image: 'assets/images/blood-pressure.png',
        color: Colors.cyan,
      ),
      InformatoinContainerModel(
        onTap: () {},
        text: 'ما هو معدل نبضات القلب',
        image: 'assets/images/blood-pressure.png',
        color: Color.fromRGBO(221, 75, 65, 1),
      ),
      InformatoinContainerModel(
        onTap: () {},
        text: 'ما هو معدل نبضات القلب',
        image: 'assets/images/blood-pressure.png',
        color: Colors.purple,
      ),
    ];

    return SizedBox(
      height: 230,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              CustomCard(containerModel: cardData[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemCount: cardData.length),
    );
  }
}
