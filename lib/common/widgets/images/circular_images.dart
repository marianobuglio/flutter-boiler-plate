import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,  
    this.height = 56,  
    this.width = 56,
    required this.image, 
    this.fit = BoxFit.cover, 
    this.isNetworkImage = false, 
    this.overlayColor, 
    this.backgroundColor, 
    this.padding = TSizes.sm,
  });
  final BoxFit? fit;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double height;
  final double width;
  final double padding;
  final String image;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor  ??  (dark ? Colors.black : Colors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        fit: fit,
        image: isNetworkImage ? NetworkImage(image) :  AssetImage(image) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}