import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCardText extends StatelessWidget {
  const TCardText({
    super.key, required this.text, this.smallSize = true,  this.maxLines = 2, this.textAlign,
    
  });

  final String text;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Text(text, 
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    textAlign: textAlign ?? TextAlign.left,
    style: smallSize ? Theme.of(context).textTheme.labelLarge!.apply(color: dark ? TColors.white : TColors.dark) :
    Theme.of(context).textTheme.bodyMedium!.apply(color: dark ? TColors.white : TColors.dark)
    );
  }
}