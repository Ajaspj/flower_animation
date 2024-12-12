import 'package:flutter/material.dart';
import 'dart:math';

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

    // Draw leaves on the stem
    if (progress > 0.2) {
      paint.style = PaintingStyle.fill;
      paint.color = Colors.green.withOpacity(progress);

      // Left leaf
      final leftLeafPath = Path()
        ..moveTo(center.dx, center.dy + budRadius / 2)
        ..quadraticBezierTo(
          center.dx - 30 * progress, // Control point for curve
          center.dy + budRadius / 2 + 20 * progress, // Control height
          center.dx, // End point x
          center.dy + budRadius / 2 + 40 * progress, // End point y
        )
        ..close();
      canvas.drawPath(leftLeafPath, paint);

      // Right leaf
      final rightLeafPath = Path()
        ..moveTo(center.dx, center.dy + budRadius / 2)
        ..quadraticBezierTo(
          center.dx + 30 * progress, // Control point for curve
          center.dy + budRadius / 2 + 20 * progress, // Control height
          center.dx, // End point x
          center.dy + budRadius / 2 + 40 * progress, // End point y
        )
        ..close();
      canvas.drawPath(rightLeafPath, paint);
    }

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
