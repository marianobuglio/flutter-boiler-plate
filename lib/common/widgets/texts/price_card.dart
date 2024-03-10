import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TextPriceCard extends StatelessWidget {
  const TextPriceCard({
    super.key, 
    required this.price, 
    this.currencySign = '\$', 
    this.maxLines = 1, 
    this.isLarge = true, 
    this.lineThrough = false,
  });

  final String price, currencySign;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Text(  currencySign + price , 
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
    style: isLarge ?  Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null, color: dark ? TColors.white : TColors.dark) :
    Theme.of(context).textTheme.headlineSmall!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null, color: dark ? TColors.white : TColors.dark)  ,
    );
  }
}