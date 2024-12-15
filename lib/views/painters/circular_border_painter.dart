import 'package:flutter/material.dart';

class CircularBorderPainter extends CustomPainter {
  final Animation<double> animation;

  CircularBorderPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const startAngle = -90 * (3.14159 / 180);
    final sweepAngle = 2 * 3.14159 * animation.value;

    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
