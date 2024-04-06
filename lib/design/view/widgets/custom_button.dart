import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onTapButton, this.textButton, this.child});
  final Widget? textButton;
  final Widget? child;
  final void Function()? onTapButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 50,
        width: double.infinity,
        child: Center(child: child),
      ),
    );
  }
}
