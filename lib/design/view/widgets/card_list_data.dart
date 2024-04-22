import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/design/view/inforamtion_page/emergency_heigh.dart';
import 'package:project_app/design/view/inforamtion_page/emergeny_low.dart';
import 'package:project_app/design/view/inforamtion_page/mis_understanding.dart';
import 'package:project_app/design/view/inforamtion_page/normal_heart.dart';
import 'package:project_app/design/view/inforamtion_page/second_card.dart';
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
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ElementAffect(),
              ));
        },
        text: 'العوامل المؤثرة في معدل نبضات القلب',
        image: 'assets/images/syringe.png',
        color: Color.fromRGBO(221, 75, 65, 1),
      ),
      InformatoinContainerModel(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MissUnderstanding(),
              ));
        },
        text: 'سوء فهم ضغط الدم',
        image: 'assets/images/examination.png',
        color: Colors.teal,
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

class CardListData2 extends StatelessWidget {
  const CardListData2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<InformatoinContainerModel> cardData = [
      InformatoinContainerModel(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EmergenyLow(),
              ));
        },
        text: 'إرشادات أزمة انخفاض ضغط الدم',
        image: 'assets/images/medical-care.png',
        color: Colors.indigo,
      ),
      InformatoinContainerModel(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EmergenyHeigh(),
              ));
        },
        text: 'إرشادات أزمة ارتفاع ضغط الدم',
        image: 'assets/images/first-aid-kit.png',
        color: Colors.lightBlue,
      ),
      InformatoinContainerModel(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NormalHeart(),
              ));
        },
        text: 'التهدئة السريعة للقلب المتسارع',
        image: 'assets/images/love.png',
        color: Colors.cyan,
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

class CardListData3 extends StatelessWidget {
  const CardListData3({super.key});

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
        text: 'امراض القلب الشائعه',
        image: 'assets/images/heart-attack.png',
        color: Colors.lightBlue,
      ),
      InformatoinContainerModel(
        onTap: () {},
        text: 'تعقيد معدل نبضات القلب',
        image: 'assets/images/doctor.png',
        color: Colors.lightGreen,
      ),
      InformatoinContainerModel(
        onTap: () {},
        text: 'التغذيه',
        image: 'assets/images/diet.png',
        color: Color.fromARGB(255, 194, 99, 211),
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
