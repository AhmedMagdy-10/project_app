import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';
import 'package:project_app/design/view/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // late Animation<double> _logoAnimation;
  late Animation<double> _heartAnimation;
  late Animation<double> _rateAnimation;
  late Animation<double> _measurementAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    const double start = 0.0;
    const double end = 2.0;

    const heartInterval = Interval(0.1, 0.4, curve: Curves.easeOut);
    const rateInterval = Interval(0.3, 0.6, curve: Curves.easeOut);
    const measurementInterval = Interval(0.5, 1.0, curve: Curves.easeOut);

    // _logoAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
    //   CurvedAnimation(
    //     parent: _animationController,
    //     curve: Curves.easeInOut,
    //   ),
    // );

    _heartAnimation = Tween<double>(begin: start, end: end).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: heartInterval,
      ),
    );

    _rateAnimation = Tween<double>(begin: start, end: end).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: rateInterval,
      ),
    );

    _measurementAnimation = Tween<double>(begin: start, end: end).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: measurementInterval,
      ),
    );

    _animationController.forward().whenComplete(() {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const OnBoardingView()),
          (route) => false,
        );
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/heart11.gif',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-0.5, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: const Interval(0.5, 0.7, curve: Curves.easeOut),
                    ),
                  ),
                  child: FadeTransition(
                    opacity: _heartAnimation,
                    child: const Text(
                      'Heart ',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-0.5, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: const Interval(0.6, 0.8, curve: Curves.easeOut),
                    ),
                  ),
                  child: FadeTransition(
                    opacity: _rateAnimation,
                    child: const Text(
                      'Rate ',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-0.5, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
                    ),
                  ),
                  child: FadeTransition(
                    opacity: _measurementAnimation,
                    child: const Text(
                      'Measurement',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
