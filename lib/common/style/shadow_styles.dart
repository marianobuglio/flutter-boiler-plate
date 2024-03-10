import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TShadowStyle {


  static final verticalCardShadow = BoxShadow(
    color : TColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0,2)
  );
  
  static final horizontalCardShadow = BoxShadow(
    color : TColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0,2)
  );
}