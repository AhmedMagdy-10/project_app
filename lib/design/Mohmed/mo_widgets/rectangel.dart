import 'package:flutter/material.dart';

class Rectangel extends StatelessWidget {
  const Rectangel({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffDDF2FD),
        ),
      ),
      const Positioned(
          right: 1,
          left: 1,
          top: 15,
          child: Column(
            children: [
              Text(
                'Our Some Food Is Not Bad For Heart',
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 8,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'Thomas Keller',
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
            ],
          ))
    ]);
  }
}
