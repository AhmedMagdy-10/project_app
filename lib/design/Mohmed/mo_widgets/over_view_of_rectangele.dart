import 'package:flutter/material.dart';
import 'package:project_app/design/Mohmed/mo_widgets/groups_on_rectangel.dart';
import 'package:project_app/design/Mohmed/mo_widgets/rectangel.dart';

class OverViewOfRectangele extends StatelessWidget {
  const OverViewOfRectangele({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 160,
      width: 280,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Rectangel(),
          Positioned(
              right: -17,
              bottom: 20,
              child: GroupOnRectangele(
                image:
                    'https://s3-alpha-sig.figma.com/img/5df4/2529/6515334958cff0b8169b7d57a05be446?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=MU4YdlrIrbVe8KnkchJ-c~VbPcvTzWsVHZGorg9Dy~byJEMZsSy8ZhmD5Y1hcvURaDsHl7X0XiPhUiW5FDgkZt6~Js29F0djfqkwwCQOed4P1-8Mg6Vd-Gxogat-w9~mPcbZATuI~jtaf8yhG99WyhOeuRCG69LBklYA8wqyE-~H94K5bHnrgACC-MiAeTbFdh3As4GkHqNeg~UvOlkGljdnwZvyWZOW90-l6d22xSkx0upVG5JMn2m5XtaGN8M4zmcBVNRSrs7SmtHg3oYoD8KW956ZzGmBQR27AR8ztDTkIlqiCSnUp6T5agIhHLJ8~F3T9WofutKUsR3cgQn9UQ__',
                text: 'You\'re familiar with greens like kale, spinach',
              )),
          Positioned(
              left: -17,
              bottom: 20,
              child: GroupOnRectangele(
                image:
                    'https://s3-alpha-sig.figma.com/img/a255/5a37/8941511dfd5962ff2df1186c1e4c58dd?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KAMDrYudOJk3aYT-9VjpkiFRFex3nHTvH6Lbw3xDW1o8Aa3t8j2bSLNwmLj9qEijcxPvFEhuQwppUB8jCC1ZNMpqtYu6vXE5LAIs5mYR0RvgIS8p3NCOIACB3d5NnjuSP24LrGu6wRLzUUrEt9ZzmQYKz4kBS3KkVNgWWNah~9JRo~8CYLeiYnfRf7~DjEUUh5d1l8X5sXQo~OAyS-MO2t~J8Lqem-oj56pssjw0pD7R2tg980nuPmo1-SmavOzKagmLxkTjrJgmo08fMSAi8ZQ-oJH5u5RN4ENmn6W2rQNJ-AF0HooxTvaVdNDuyPxLOlGjjlQe6fsAJfKmfBbnRg__',
                text:
                    'your best and healthiest life. Things like how much sleep',
              )),
          Positioned(
              left: 95,
              right: 95,
              bottom: 40,
              child: GroupOnRectangele(
                image:
                    'https://s3-alpha-sig.figma.com/img/def2/6ce3/f8bae09d104d752d16da5ba4f60a0490?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=UmFMBvEmMfSFwdfjo--LHe1C1pxcvK3-MC7DCgWac1EaAJ5lZllKyxt~nKrRU~y~2O8~mf-1Bc6rWwzul5Ld50zee-Oxo5sk6~c1GM4lqY7lozKc~LABMAqCY0-Fg229vZ4TjeoSTbhcHKx~CRApFqw1EoP5o2ZSu14jJ1e16RXY3gXvEnpahr8iOnvW91CrH-U2Sp1f0Nl1mpoBZ97dU4~LmS1PlNPjnArnYrlmykXxHmM1tVZCtosnHyWYMVRTsuwswRM2QFqDgsRaaP~IH97cE5TqzwZAmZa1k8pNuIv0l9ztjTrj6M7MToFBz5ysjaqzI6l9y7grNqHukvsx7A__',
                text:
                    'One of the healthiest vegetables you can eat is broccoli',
              )),
        ],
      ),
    );
  }
}
