import 'dart:math';
import 'package:flutter/material.dart';

import '../../services/constants/constants.dart';

class RotatingDots extends StatefulWidget {
  const RotatingDots({super.key});

  @override
  _RotatingDotsState createState() => _RotatingDotsState();
}

class _RotatingDotsState extends State<RotatingDots> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: CustomPaint(
            size: const Size(100, 100),
            painter: RotatingDotsPainter(),
          ),
        );
      },
    );
  }
}

class RotatingDotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.secondaryColor
      ..style = PaintingStyle.fill;


    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;


    for (int i = 0; i < 3; i++) {
      final angle = 2 * pi * (i / 5);
      final offset = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
      canvas.drawCircle(offset, 8, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}