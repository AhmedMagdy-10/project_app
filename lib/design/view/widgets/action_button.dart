import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton(
      {super.key, required this.onTap, required this.child});
  final void Function() onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}
