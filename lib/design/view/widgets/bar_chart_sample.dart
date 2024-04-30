import 'package:flutter/material.dart';
import 'package:project_app/constants/constant.dart';

class BuildTimer extends StatelessWidget {
  const BuildTimer(
      {super.key,
      required this.seconds,
      required this.maxSecond,
      required this.receivedValue});
  final int seconds;
  final String receivedValue;
  final maxSecond;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: seconds / maxSecond,
              valueColor: AlwaysStoppedAnimation(
                Colors.grey[300],
              ),
              backgroundColor: secondColor,
              strokeWidth: 12,
            ),
            Center(
              child: BuildTime(
                receivedValue: receivedValue,
              ),
            )
          ],
        ));
  }
}

class BuildTime extends StatelessWidget {
  const BuildTime({
    super.key,
    required this.receivedValue,
  });
  final String receivedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          receivedValue,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.black,
          ),
        ),
        Text(
          'Bp/m ',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
