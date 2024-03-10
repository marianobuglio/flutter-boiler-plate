import 'package:acomerlapp/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class TextBrandTitle extends StatelessWidget {
  const TextBrandTitle({
    super.key,
    required this.text,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.textColor ,
    this.textSize = TextSizes.small ,
  });

  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final Color? textColor;
  final TextSizes textSize;
  @override
  Widget build(BuildContext context) {
    
    return Text(text,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
    textAlign: textAlign,
    style: 
    textSize == TextSizes.small 
      ? Theme.of(context).textTheme.labelMedium!.apply(color:textColor) 
      : textSize == TextSizes.medium 
        ?  Theme.of(context).textTheme.bodyLarge!.apply(color:textColor) 
        : textSize == TextSizes.large 
        ?  Theme.of(context).textTheme.titleLarge!.apply(color:textColor) 
        :  Theme.of(context).textTheme.bodyMedium!.apply(color:textColor) 
    );
  }
}