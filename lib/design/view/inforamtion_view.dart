import 'package:flutter/material.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text(
            'Impotant Informatoin',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: InkWell(
          onTap: () {},
          child: Container(
            height: 250,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.cyan,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/blood-pressure.png',
                    width: 100,
                    height: 150,
                  ),
                  const Text(
                    'ما هو معدل نبضات القلب ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
