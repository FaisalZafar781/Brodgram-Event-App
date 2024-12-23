import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final double height;
  final double dotWidth;
  final double spacing;
  final Color color;

  const DottedDivider({
    super.key,
    this.height = 1.0,
    this.dotWidth = 4.0,
    this.spacing = 4.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedLinePainter(
        dotWidth: dotWidth,
        spacing: spacing,
        color: color,
      ),
      child: SizedBox(
        height: height,
        width: double.infinity,
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final double dotWidth;
  final double spacing;
  final Color color;

  DottedLinePainter({
    required this.dotWidth,
    required this.spacing,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = dotWidth;

    double startX = 0;
    final spaceBetweenDots = dotWidth + spacing;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dotWidth, size.height / 2),
        paint,
      );
      startX += spaceBetweenDots;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
