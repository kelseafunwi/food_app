import 'package:flutter/material.dart';
import 'package:food_app/views/painters/circular_border_painter.dart';

class AnimatedCircularBorder extends StatefulWidget {
  const AnimatedCircularBorder({super.key, required this.content});

  final Widget content;

  @override
  State<AnimatedCircularBorder> createState() => _AnimatedCircularBorderState();
}

class _AnimatedCircularBorderState extends State<AnimatedCircularBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircularBorderPainter(_controller),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: widget.content,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
