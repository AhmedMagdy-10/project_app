import 'package:flutter/material.dart';
import 'package:project_app/design/Mohmed/mo_widgets/custom_circuler_image.dart';

class GeneralFoods extends StatelessWidget {
  const GeneralFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomCircuralImage(
            width: 64,
            image:
                'https://s3-alpha-sig.figma.com/img/d1fb/137d/76e8b27df4b8bb3d65c921877dbb63f2?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FrEkB-t1f52EuMETmnnH5Hr~Ww900wK-IBMeqNPuHCWxw1g1aWp-H9SZPHigRIPbmd5BAA2L4yf9yw8LtPyuewJce0wALErcpwtOoaXeG8U3fDms6v3hAUiVUVOiKHzS8dCjKiXOKj62wjAgweIFvmwgdqRSr~jYDnsSSUcjgmFiL0IEkntTP2UFpG9kZCxy55LvFckNyAZS2xkOgslKRBTYNDTtLM~SJDCUlBJYQwNYQt7G9xeg6ZAOI0b7YtZGC3243SDcn61lUXnRAWTLH5YFIvBrS5-ffwcyYtz~NUGVXD9IVcP5plHuwhWlFDVMfZE2Ha~nmwUUR8KLZP0k7w__',
            text: "Salad"),
        CustomCircuralImage(
            width: 64,
            image:
                'https://s3-alpha-sig.figma.com/img/b9d3/1043/6631dddcd1a9bbf11f786066f937a0db?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OKrqRFFNGH5GxuStNa~7hCpeRuJRMSgKHyR2O0Of1z7xfxoad1usUIXzQChjUe093~y74tlhUu3vgQ5zYwE7a7uiTxDq1ov0uPhSqKHmPZXbsjtPoP2P7DuD1~RxTuzK9BtDVVTmpsvrE~ZJD-l~gNLGUpF5KtSPVMRQREtF31Pcmifu~B3R8UyySi3zpkNOOFip5q3jyGcw9bDH1uFTQrsBzUKJmxvvj7AmhmcSEDvzq7JOLcNvOn2-4YsHcHuy27A1-c36BiAxNZl5G5kxqMr6K4gYLkiQZdSNe~4phDAJVBOHfmFYCLw8AJZiZvvFnKqjOlKsa5mn~Rd5LolkLQ__',
            text: 'Pasta'),
        CustomCircuralImage(
            width: 64,
            image:
                'https://s3-alpha-sig.figma.com/img/7b32/ef99/61dd0f716417828ba6dad817d9100449?Expires=1713744000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ci8OhhSVsddXCAflmUvcDH0AjkeGZaP~3YpeLgqrSv~Ygf4eAqbJfL3ERpPe4NdCkoH0DWy~BWHHSP7iU6oODbI2jEc56zz8yUUr3n0WmVG44pmw6CPHJP196NlIJY2UcF3-ScNyxOv-ZHldn6DpuO7M4BRG-EnliOaVpMdghANylAPeit7hwJXnKjSLb1VwlLSoy~Kekt5KvEdyeUS6rQ2j4qlVssvdorD9N4SsGQBoebeMws92bJuV-mi9D3zzyuOufwXr7okRUdf7uer9e00A-DlK3nc5IZiycG9nxXTcjpZ00-0dCP4rMMExwR7KAzrhW5sn~VjujjINa~yPYQ__',
            text: 'Rice'),
      ],
    );
  }
}
