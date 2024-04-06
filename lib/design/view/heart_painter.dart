import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'dart:math' as math;
import 'package:flutter/material.dart';

class HeartPainter extends CustomPainter {
  final double fillPercentage;

  HeartPainter({required this.fillPercentage});

  @override
  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Paint fillPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    double centerX = size.width / 2;
    double centerY = size.height / 4;
    double maxRadius = math.min(size.width, size.height) / 2;

    // Draw the border of the heart shape
    Path path = Path()
      ..moveTo(centerX, centerY + maxRadius / 4)
      ..cubicTo(
        centerX + maxRadius / 4,
        centerY - maxRadius / 2,
        centerX + maxRadius,
        centerY - maxRadius / 8,
        centerX,
        centerY + maxRadius,
      )
      ..cubicTo(
        centerX - maxRadius,
        centerY - maxRadius / 8,
        centerX - maxRadius / 4,
        centerY - maxRadius / 2,
        centerX,
        centerY + maxRadius / 4,
      );
    canvas.drawPath(path, borderPaint);

    // Calculate the clipping area based on the fill percentage
    double clipHeight = size.height * fillPercentage;
    Rect clipRect = Rect.fromLTRB(
      centerX - maxRadius,
      centerY - maxRadius / 2 + maxRadius / 4 * (1 - fillPercentage),
      centerX + maxRadius,
      centerY + maxRadius / 4,
    );
    canvas.clipRect(clipRect);

    // Draw the heart with the fill color
    canvas.drawPath(path, fillPaint);

    // Draw the fillPercentage as text at the center of the heart
    TextSpan span = TextSpan(
      text: '${(fillPercentage * 100).toInt()}%',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(
      canvas,
      Offset(centerX - tp.width / 2, centerY + maxRadius / 2 - tp.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeartWidget extends StatelessWidget {
  final double fillPercentage;

  const HeartWidget({super.key, required this.fillPercentage});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HeartPainter(fillPercentage: fillPercentage),
      child: Container(),
    );
  }
}
