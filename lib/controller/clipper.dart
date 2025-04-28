import 'dart:math';

import 'package:flutter/material.dart';

class MyClipper extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var Size(:width,:height)=size;
    var radius=min(width,height)/2;
    canvas.drawCircle(Offset(width/2,height/2),min(width,height)/2*0.9, Paint()..color=Colors.yellow);
    canvas.save();
    canvas.translate(width/2,height/2);
    for (var i = 0; i <360; i+=5) {
      canvas.drawLine(Offset(0,-radius), Offset(0,-(radius-(radius*0.1))), Paint()..color=Colors.amber..strokeWidth=4..strokeCap=StrokeCap.round);
      canvas.rotate(i*pi/180);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate!=oldDelegate;
  }
  
}