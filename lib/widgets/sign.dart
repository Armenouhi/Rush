import 'package:flutter/material.dart';

class Sign extends StatelessWidget {
  const Sign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        color: Colors.greenAccent,
        child: CustomPaint(
          foregroundPainter: MyTextPainter(),
          painter: MyPainter(),
        ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color.fromRGBO(204, 0, 1, 0.8);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 50.0;
    paint.strokeCap;
    paint.style;
    paint.isAntiAlias;

    var path = Path();

    path.relativeLineTo((size.height), (size.height));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyTextPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30,
    );
    final textSpan = TextSpan(
      text: 'Hello, world.',
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

    final offset = Offset(-45, 300);
    canvas.rotate(-45);
    textPainter.paint(canvas, offset);

    var path = Path();
    path.lineTo(size.height, size.height);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}
