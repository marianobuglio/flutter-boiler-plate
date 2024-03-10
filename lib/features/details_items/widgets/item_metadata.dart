import 'package:acomerlapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:acomerlapp/common/widgets/images/circular_images.dart';
import 'package:acomerlapp/common/widgets/texts/card_title.dart';
import 'package:acomerlapp/common/widgets/texts/price_card.dart';
import 'package:acomerlapp/common/widgets/texts/text_verified_icon.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/enums.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ItemMetaData extends StatelessWidget {
  const ItemMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price & sale price

        Row(
          children: [ 
            // Sale tag
             TRoundedContainer(
                  radius: TSizes.sm,
                  color: TColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.sm),
                  child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color:TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text("\$250", style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TextPriceCard(price: "199")
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 2 ),
        //title
        const TCardText(text:"Green nike shoes", smallSize: false),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5 ),
        //stock
        Row
        (children:[ 
          const TCardText(text:"Status: ",smallSize: false),
          const SizedBox(width: TSizes.spaceBtwItems / 1.5 ),
          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
        ]),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5 ),
        //brand
        const Row(children: [
          CircularImage(image: TImages.nikeLogo,),
          TextWithVerifiedIcon(text: 'Nike', textSize: TextSizes.medium),
          SizedBox(width: TSizes.spaceBtwItems / 1.5 ),
        ])
      ],
    );
  }
}