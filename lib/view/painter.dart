import 'dart:math';

import 'package:flutter/material.dart';

class FlowerPainter extends CustomPainter {
  final double progress;

  FlowerPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.green;

    final center = Offset(size.width / 2, size.height / 2);
    final budRadius = 10.0 + (progress * 20); // Animate bud to bloom
    final petalRadius = 50.0 * progress; // Animate petal growth
    const petalCount = 6;

    // Draw the stem
    paint.color = Colors.green;
    paint.style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(center.dx, size.height),
      Offset(center.dx, center.dy + budRadius),
      paint,
    );

    // Draw the bud or flower center
    paint.style = PaintingStyle.fill;
    paint.color = Colors.orange;
    canvas.drawCircle(center, budRadius, paint);

    // Draw petals
    if (progress > 0.3) {
      paint.color = Colors.pink.withOpacity(progress);
      paint.style = PaintingStyle.fill;
      for (int i = 0; i < petalCount; i++) {
        final angle = (2 * pi / petalCount) * i;
        final petalCenter = Offset(
          center.dx + petalRadius * cos(angle),
          center.dy + petalRadius * sin(angle),
        );
        canvas.drawCircle(petalCenter, petalRadius / 3, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Redraw every frame
  }
}
