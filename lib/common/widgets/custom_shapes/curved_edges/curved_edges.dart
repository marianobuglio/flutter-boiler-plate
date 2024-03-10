import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final secondCurve = Offset(30, size.height - 20 );


    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, secondCurve.dx, secondCurve.dy);
    
    final thirthCurve = Offset(0 , size.height - 20);
    final fourthCurve = Offset(size.width -30 , size.height - 20);
    
    path.quadraticBezierTo(thirthCurve.dx, thirthCurve.dy,  fourthCurve.dx, thirthCurve.dy);


    final fiveCourve = Offset(size.width ,size.height - 20);
    final sixCourve = Offset(size.width , size.height);
    // final fiveCourve = Offset(size.width , size.height - 20);
    // final sixCourve = Offset(size.width  , size.height );
    
     path.quadraticBezierTo(fiveCourve.dx, fiveCourve.dy,  sixCourve.dx, sixCourve.dy);
    
    path.lineTo(size.width, 0);
    path.close();
    
    return path;  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
 
}