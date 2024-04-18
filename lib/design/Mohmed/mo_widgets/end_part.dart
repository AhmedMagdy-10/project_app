import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EndPartOfScreen extends StatelessWidget {
  const EndPartOfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius:
                  BorderRadius.circular(8) // Adjust the radius as needed
              ),
        ),
        Positioned(
            left: 100,
            child: Container(
              child: Image.network(
                'https://s3-alpha-sig.figma.com/img/b022/7179/e9407dc6bfc6cc7ff7322d3b23cbd005?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WpqHICveE97rVpSzW~lOHPUrWCSLm7u4wDXJmG-gx6FnHYDuNeVtUCOn6H7lg6GyigNOyBUvM7AlF9j2MX8aILOHppAPXfXAvHRqtsiFbLYRHDNH6IHG4e~zen1L-xhDzd6Y5Qa2YCSZ~j6iPiIy3KqZ4Y2uS-BSnycPT7Dtkr6cmO47FuOdTJ5iM5IWe84P1D4EfJ7Yjk3nIa6SKUY4VEQCsVQiZVrIdd36rTDmLOrNBEAaclSHwZIzkZxbmpKXJ9n-hMV6GEJRsj90~hiEX2TEP3~8OyZqQ1FScTtXNPZRdqBENFdZb5ZM-nSV9FkbTEFmwkSCPWRki3mHZz9fng__',
                width: 120,
                height: 90,
              ),
            )),
        const Positioned(
          left: 100,
          bottom: 40,
          child: SizedBox(
            width: 120,
            child: Text(
              'To Eat The Best Food For you must The visit the website',
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 8,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w700),
              softWrap: true,
              maxLines: 2,
            ),
          ),
        ),
        const Positioned(
          left: 105,
          bottom: 25,
          child: Text(
            'https://www.seha.sa',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 8,
              color: Color(0xff0082FA),
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
            softWrap: true,
            maxLines: 2,
          ),
        ),
        Positioned(
          right: 30,
          bottom: 0,
          child: Image.network(
            'https://s3-alpha-sig.figma.com/img/bbdc/8a15/da16db059c9ff413f4e9f8272017f4fa?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RQhuYnMQgmKghKS0lvoIkb5KGY75C32faKGbnoY4D-EZ21fBhVRH0rVZw268h2kJSeQGBLdPYjc1uRVLojAYnrnr8cDbJKiIfuSxAtAe0ELim2In5uar6vDIkTGY6376JYFvf31KVP~6Jo0TKebxC6BSYPS3mpDBcwaPrQsgbIaiCmQjSjaDl93Vq5iLlXJ6rlZQX0RrzM3-XuTddpunVF7hzcWLLgAjVG06ulW3qmPjUYTEs-Q0D0tFaO0RNl06A9D7lysC4rowzIofj-ue7XUmGSHMN~uqRkXEM~4EwjwNulwjhp8a1v-wdsNu-R-M7SKZFdR9Bd3qgAN-5GB2qA__',
            width: 55,
            height: 90,
          ),
        )
      ],
    );
  }
}
