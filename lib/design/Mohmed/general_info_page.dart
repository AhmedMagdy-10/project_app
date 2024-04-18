import 'package:flutter/material.dart';
import 'package:project_app/design/Mohmed/mo_widgets/artical_part.dart';
import 'package:project_app/design/Mohmed/mo_widgets/end_part.dart';
import 'package:project_app/design/Mohmed/mo_widgets/finl_circular_images.dart';
import 'package:project_app/design/Mohmed/mo_widgets/over_view_of_rectangele.dart';

class GneteralFoodInfo extends StatelessWidget {
  const GneteralFoodInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,
          title: const Text(
            'Food Details',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 10,
            ),
            const GeneralFoods(),
            const SizedBox(
              height: 20,
            ),
            const OverViewOfRectangele(),
            const SizedBox(
              height: 30,
            ),
            const Expanded(
                child: ArticalPart(
              articalImage:
                  'https://images.unsplash.com/photo-1606756790138-261d2b21cd75?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGhlYWx0aHklMjBmb29kfGVufDB8fDB8fHww',
              articalText:
                  'Healthy food is this food that contains a lot of health benefits for the body and does not contain any damage, \nwhich is the food that everyone must add to their diet, healthy food helps greatly to enjoy good health and a strong,\n healthy and healthy body and in the prevention of obesity and many bad diseases',
              cookerImage:
                  'https://www.boneta.ca/wp-content/uploads/2018/08/Alain-Ducasse.jpg',
              cookerName: "Alain Ducasse",
            )),
            Container(
              color: Colors.black,
              child: const EndPartOfScreen(),
            ),
          ],
        ));
  }
}
  





  //  Center(
  //       child: Stack(
  //         children: [
  //           Container(
  //             width: 95,
  //             height: 70,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(8), color: Colors.red),
  //           ),
  //           Positioned(
  //             top: .2,
  //             right: 10,
  //             child: Container(
  //               width: 71,
  //               height: 58,
  //               decoration:
  //                   BoxDecoration(borderRadius: BorderRadius.circular(8)),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   const SizedBox(
  //                     height: 1,
  //                   ),
  //                   Container(
  //                     clipBehavior: Clip.antiAlias,
  //                     decoration:
  //                         BoxDecoration(borderRadius: BorderRadius.circular(8)),
  //                     child: Image.network(
  //                       'https://s3-alpha-sig.figma.com/img/5df4/2529/6515334958cff0b8169b7d57a05be446?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=MU4YdlrIrbVe8KnkchJ-c~VbPcvTzWsVHZGorg9Dy~byJEMZsSy8ZhmD5Y1hcvURaDsHl7X0XiPhUiW5FDgkZt6~Js29F0djfqkwwCQOed4P1-8Mg6Vd-Gxogat-w9~mPcbZATuI~jtaf8yhG99WyhOeuRCG69LBklYA8wqyE-~H94K5bHnrgACC-MiAeTbFdh3As4GkHqNeg~UvOlkGljdnwZvyWZOW90-l6d22xSkx0upVG5JMn2m5XtaGN8M4zmcBVNRSrs7SmtHg3oYoD8KW956ZzGmBQR27AR8ztDTkIlqiCSnUp6T5agIhHLJ8~F3T9WofutKUsR3cgQn9UQ__',
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           const Positioned(
  //             left: 10,
  //             bottom: 5,
  //             child: Text(
  //               'One of the healthiest vegetables you can eat is broccoli',
  //               style: TextStyle(
  //                 fontFamily: 'Cairo',
  //                 fontSize: 5,
  //                 fontWeight: FontWeight.w700,
  //               ),
  //               softWrap: true,
  //               maxLines: 2,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),