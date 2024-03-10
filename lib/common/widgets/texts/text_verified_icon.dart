import 'package:acomerlapp/common/widgets/texts/text_title_cards.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/enums.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TextWithVerifiedIcon extends StatelessWidget {
  const TextWithVerifiedIcon({
    super.key, 
    required this.text, 
    this.maxLines = 1, 
    this.textColor , 
    this.iconColor = TColors.primary, 
    this.textAlign = TextAlign.start, 
    this.textSize = TextSizes.medium, 
  });
  final String text;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child:TextBrandTitle(
            text: text, 
            maxLines: maxLines, 
            textAlign: textAlign, 
            textColor: textColor, 
            textSize: textSize
          )
        ),
        const SizedBox(width: TSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size:TSizes.iconXs)
      ],
    );
  }
}

