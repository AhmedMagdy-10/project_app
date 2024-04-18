import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:project_app/design/Mohmed/mo_widgets/custom_circuler_image.dart';

class ArticalPart extends StatelessWidget {
  const ArticalPart(
      {super.key,
      required this.articalImage,
      required this.cookerImage,
      required this.articalText,
      required this.cookerName});
  final String articalImage;
  final String cookerImage;
  final String articalText;
  final String cookerName;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: 200,
        decoration: const BoxDecoration(color: Colors.transparent),
      ),
      Positioned(
          left: 130,
          child: RightSide(
            cookerImage: cookerImage,
            articalText: articalText,
            cookerName: cookerName,
          )),
      Positioned(
        left: 10,
        top: 7,
        child: CustomCircuralImage(image: articalImage, text: '', width: 100),
      ),
    ]);
  }
}

class RightSide extends StatelessWidget {
  const RightSide({
    super.key,
    required this.cookerImage,
    required this.articalText,
    required this.cookerName,
  });
  final String cookerImage;
  final String articalText;
  final String cookerName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            Row(
              children: [
                CustomCircuralImage(
                  image: cookerImage,
                  text: '',
                  width: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24, left: 6),
                  child: Column(
                    children: [
                      Text(
                        cookerName,
                        style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 8,
                            fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        'Cooker',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              child: Text(
                articalText,
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
                softWrap: true,
                maxLines: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
