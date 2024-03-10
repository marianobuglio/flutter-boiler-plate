import 'package:acomerlapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:acomerlapp/common/widgets/images/circular_images.dart';
import 'package:acomerlapp/common/widgets/texts/text_verified_icon.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/enums.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    super.key, 
    required this.image, 
    required this.title, 
    required this.subtitle, 
    this.textSize = TextSizes.medium,
    this.onTap
  });

  final String image, title, subtitle;
  final TextSizes textSize;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
      color: dark ? TColors.dark : TColors.light,
      padding: const EdgeInsets.all(TSizes.sm),
      showBorder: false,
      child: Row(
          children: [
            /// icon
            Flexible(child: CircularImage(image: image, overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,)),
            
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            
            /// text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWithVerifiedIcon(text:title, textSize: textSize),
                  Text(subtitle, overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.labelSmall)
                ],
              ),
            )
            /// 
          ],
      ),
      ),
    );
  }
}