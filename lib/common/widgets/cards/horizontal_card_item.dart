import 'package:acomerlapp/common/style/shadow_styles.dart';
import 'package:acomerlapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:acomerlapp/common/widgets/icons/rounded_icon.dart';
import 'package:acomerlapp/common/widgets/images/rounded_images.dart';
import 'package:acomerlapp/common/widgets/texts/card_title.dart';
import 'package:acomerlapp/common/widgets/texts/price_card.dart';
import 'package:acomerlapp/common/widgets/texts/text_verified_icon.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ItemHorizontalCard extends StatelessWidget {
  const ItemHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration:BoxDecoration(
          boxShadow: [TShadowStyle.verticalCardShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
           color: dark ? TColors.darkGrey : TColors.lightContainer,
        ),
        child: Row(children: [ 
            // thumbail
            TRoundedContainer(

              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              color: dark ? TColors.darkGrey : TColors.light,
              child: const Stack(
                children :[
                  /// Thumbail Image
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true)
                  ),
                  /// favorite icon
                     Positioned(
                      top:0,
                      right:0,
                      child: TRoundedIcon(icon: Iconsax.heart5, color: Colors.red)
                    ),  
                         
                ]
              )
            ),
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top:TSizes.sm, left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                          TCardText(text: "Green nike T-sirth", smallSize: false),
                          SizedBox( height: TSizes.spaceBtwItems / 2,),
                          TextWithVerifiedIcon(text: 'Nike')
                        ],
                      ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ 
                        const Flexible(child: TextPriceCard(price:"599")),
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
                  ],
                ),
              ),
            )
        ]),
    );
  }
}