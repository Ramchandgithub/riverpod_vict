
import 'dart:math';

import 'package:flutter/material.dart';

class ColorLoader extends StatefulWidget {


  final Color color1;
  final Color color2;
  final Color color3;
  ColorLoader({super.key, this.color1 = Colors.deepOrangeAccent, this.color2 = Colors.blue, this.color3 = Colors.green});

  @override
  State<ColorLoader> createState() => _ColorLoaderState();
}

class _ColorLoaderState extends State<ColorLoader> with TickerProviderStateMixin {
  
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;
  
  
  @override
  void initState(){
    super.initState();
    controller1 = AnimationController(vsync: this,duration: const Duration(milliseconds: 1200));
    controller2 = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    controller3 = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller1, curve: Interval(0.0, 1.0, curve: Curves.linear )));
    animation2 = Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(parent: controller2, curve: Interval(0.0, 1.0, curve: Curves.easeIn )));
    animation3 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller3, curve: Interval(0.0, 1.0, curve: Curves.decelerate )));
controller1.repeat();
controller2.repeat();
controller3.repeat();

  }

  @override
  void dispose(){
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: [
             RotationTransition(
                 turns: animation1,
             child: CustomPaint(painter: Arc1Painter(widget.color1),
             child: Container(width: 50.0,height: 50.0,),
             ),),
          ],
        ),
      ),
    );
  }
}

class Arc1Painter extends CustomPainter {
  final Color color;
  Arc1Painter(this.color);

  @override
  void paint(Canvas canvas, Size size){
    Paint p1 = Paint()
    ..color = color
        ..strokeWidth = 2.0
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;
    Rect rect1 = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    canvas.drawArc(rect1, 0.0, 0.5 * pi, false, p1);
    canvas.drawArc(rect1, 0.6*pi, 0.8 * pi, false, p1);
    canvas.drawArc(rect1, 1.5*pi, 0.4 * pi, false, p1);

  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
