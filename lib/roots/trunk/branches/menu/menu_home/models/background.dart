import 'package:flutter/material.dart';

class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    _drawPentagone(canvas, size);
  }

  _drawPentagone(Canvas canvas, Size size) {
    var path = Path();
    path.addPolygon([
      //new Offset(size.width, size.height/5),
      Offset(size.width, size.height / 5),
      Offset(size.width, size.height),
      Offset(0.0, size.height),
      Offset(0.0, size.height / 2.5),
    ], true);
    path.close();
    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
