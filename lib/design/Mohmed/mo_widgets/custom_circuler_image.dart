import 'package:flutter/material.dart';
import 'package:project_app/design/Mohmed/health_care_page.dart';

class CustomCircuralImage extends StatelessWidget {
  const CustomCircuralImage(
      {super.key,
      required this.image,
      required this.text,
      required this.width});
  final String image;
  final String text;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HealthCrePage()),
        );
      },
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: width,
            child: Container(
              width: width - 10,
              height: width - 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xffbacd9d9d9),
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "Cairo",
              fontSize: 8,
              fontWeight: FontWeight.w700,
            ),
            softWrap: true,
            maxLines: 7,
          )
        ],
      ),
    );
  }
}
