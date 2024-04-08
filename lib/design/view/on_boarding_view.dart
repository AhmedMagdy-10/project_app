import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/design/view/login_view.dart';
import 'package:project_app/design/view/widgets/build_onboarding_item.dart';
import 'package:project_app/logic/data/localData/onborading_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController boardcontroller = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardcontroller,
                itemBuilder: (context, index) => BuildOnBoardingItem(
                  model: onBoradingItem[index],
                ),
                onPageChanged: (int index) {
                  if (index == onBoradingItem.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemCount: onBoradingItem.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: boardcontroller,
                    count: onBoradingItem.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: secondColor,
                      dotColor: Colors.grey[300]!,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 0.8,
                      expansionFactor: 3,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: secondColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    onPressed: () {
                      if (isLast) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ));
                      } else {
                        boardcontroller.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
