import 'package:flutter/material.dart';

class CustomCalendarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = .6
      ..style = PaintingStyle.stroke;
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
    );

    for (int i = 0; i < 24; i++) {
      final textSpan = TextSpan(
        text: i == 23 ? "00:00" : "${(i + 1).toString().padLeft(2, "0")}:00",
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      const double xCenter = 10;
      double yCenter = i * 120 - 8;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
      final path2 = Path()
        ..moveTo(50, i * 120)
        ..lineTo(size.width, i * 120);
      if (i != 0) {
        canvas.drawPath(path2, paint);
      }
    }
    final path = Path()
      ..moveTo(60, 0)
      ..lineTo(60, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
