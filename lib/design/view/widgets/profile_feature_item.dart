import 'package:flutter/material.dart';
import 'package:project_app/constants/icon_broken.dart';

class ProfileFeatureItem extends StatelessWidget {
  const ProfileFeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                IconBroken.Lock,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Expanded(
            child: Text(
              'Toxic Team',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xffA1A1A1),
              ),
            ),
          ),
          const Icon(
            IconBroken.Arrow___Right_Circle,
            size: 30,
            color: Color(0xffA1A1A1),
          ),
        ],
      ),
    );
  }
}
