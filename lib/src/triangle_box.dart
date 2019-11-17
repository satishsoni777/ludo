import 'package:flutter/material.dart';

class TriangleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        alignment: Alignment.center,
        child: Icon(
          Icons.star,
          color: Colors.yellow[100],
        ),
      ),
      painter: DrawTriangle(),
    );
  }
}

class DrawTriangle extends CustomPainter {
  Paint _paintTr(Color c) {
    final _paint = Paint()
      ..color = c
      ..style = PaintingStyle.fill;
    return _paint;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    var path = Path();
    path.moveTo(size.width / 2, size.width / 2);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    canvas.drawPath(path, _paintTr(Colors.green));
    var path1 = Path();
    path1.moveTo(size.width / 2, size.width / 2);
    path1.lineTo(0, 0);
    path1.lineTo(0, size.height);
    path1.close();
    canvas.drawPath(path1, _paintTr(Colors.red));
    var path2 = Path();
    path2.moveTo(size.width / 2, size.width / 2);
    path2.lineTo(0, 0);
    path2.lineTo(size.width, 0);
    path2.close();
    canvas.drawPath(path2, _paintTr(Colors.blue));
    var path3 = Path();
    path3.moveTo(size.width / 2, size.width / 2);
    path3.lineTo(size.width, 0);
    path3.lineTo(size.height, size.width);
    path3.close();
    canvas.drawPath(path3, _paintTr(Colors.yellow));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
