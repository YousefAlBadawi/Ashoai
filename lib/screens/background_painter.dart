import 'package:flutter/material.dart';

class GlowyBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // كرة ضوء في أعلى الشمال
    final paint1 = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF9333EA).withOpacity(0.4),
          const Color(0xFF9333EA).withOpacity(0.0),
        ],
        radius: 0.8,
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.2, size.height * 0.1),
        radius: size.width * 0.4,
      ));
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.1),
      size.width * 0.4,
      paint1,
    );

    // كرة ضوء في أسفل اليمين
    final paint2 = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF6B21A8).withOpacity(0.3),
          const Color(0xFF6B21A8).withOpacity(0.0),
        ],
        radius: 0.8,
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.9, size.height * 0.8),
        radius: size.width * 0.5,
      ));
    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.8),
      size.width * 0.5,
      paint2,
    );

    // كرة ضوء صغيرة في النص على اليسار بلون أفتح شوية
    final paint3 = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFD8B4FE).withOpacity(0.15),
          const Color(0xFFD8B4FE).withOpacity(0.0),
        ],
        radius: 0.6,
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.1, size.height * 0.6),
        radius: size.width * 0.3,
      ));
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.6),
      size.width * 0.3,
      paint3,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
