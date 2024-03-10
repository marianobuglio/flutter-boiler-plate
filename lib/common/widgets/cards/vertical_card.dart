

import 'package:acomerlapp/common/style/shadow_styles.dart';
import 'package:acomerlapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:acomerlapp/common/widgets/icons/rounded_icon.dart';
import 'package:acomerlapp/common/widgets/images/rounded_images.dart';
import 'package:acomerlapp/common/widgets/texts/card_title.dart';
import 'package:acomerlapp/common/widgets/texts/price_card.dart';
import 'package:acomerlapp/common/widgets/texts/text_verified_icon.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class VerticalCard extends StatelessWidget {
  const VerticalCard({super.key, 
    required this.image, 
    required this.onPressed
  });

  final String image;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  GestureDetector(
      onTap:onPressed,
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration:BoxDecoration(
          boxShadow: [TShadowStyle.verticalCardShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
          TRoundedContainer(
           height: 180,
           padding: const EdgeInsets.all(TSizes.sm),
           color: dark ? TColors.dark : TColors.light,
           child:  Stack(
             children :[
              /// Image
              TRoundedImage(imageUrl: image),
              /// favorite icon
              const Positioned(
                top:7,
                left:7,
                child: TRoundedIcon(icon: Iconsax.heart5, color: Colors.red)
              ),          
              ]
           ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          const Padding(
                padding: EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TCardText(text: 'New Product', smallSize: false),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    TextWithVerifiedIcon(text: 'Nike' ),
                    
                    
                  ],
                )
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextPriceCard(price: '250'),
                Container(
                  decoration:const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius)
                    )
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(child: Icon(Iconsax.add, color:TColors.white)))
                )
              ],
            )
        ]),
      ),
    );
  }
}







