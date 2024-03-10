



import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({super.key, 
      this.width,
      this.height,
      this.padding,
      this.margin,
      this.radius = TSizes.cardRadiusLg ,
      this.color = TColors.white,
      this.showBorder = false,
      this.borderColor = TColors.borderPrimary, 
      this.child, 
    });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double radius;
  final Color color;
  final bool showBorder;
  final Color borderColor;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
        border: showBorder ?  Border.all(color: borderColor) : null,
      ),
    child: child,
    );
  }
}