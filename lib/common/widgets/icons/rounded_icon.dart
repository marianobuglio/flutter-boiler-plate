import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TRoundedIcon extends StatelessWidget {
  const TRoundedIcon({
    super.key, 
    this.width, 
    this.height, 
    required this.icon, 
    this.onPressed, 
    this.size = TSizes.lg,  
    this.backgroundColor, 
    this.color = TColors.primary,

  });

  final double? width;
  final double? height;
  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final Color? backgroundColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null ?
         backgroundColor! 
         : dark ? TColors.dark.withOpacity(0.9) : TColors.light.withOpacity(0.9),
      ),
      child : IconButton(
        onPressed: (){},
        icon: Icon(icon, color: color ,size: size),
      ),
    );
  }
}