import 'package:acomerlapp/common/widgets/chips/choice_chips.dart';
import 'package:acomerlapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:acomerlapp/common/widgets/texts/price_card.dart';
import 'package:acomerlapp/common/widgets/texts/sectionc_header.dart';
import 'package:acomerlapp/common/widgets/texts/text_title_cards.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/enums.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Attributes extends StatelessWidget {
  const Attributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // -- selected Attributes Pricing & Description
        TRoundedContainer(
          color: dark ? TColors.darkGrey : TColors.grey,
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                children: [
                  const TSectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      children: [
                        const TextBrandTitle(
                            text: 'Price: ',
                            textSize: TextSizes.small,
                            textColor: TColors.black),
                       const SizedBox(width: TSizes.spaceBtwItems),

                        //actual price
                        Text('\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough)),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        //sale price
                        const TextPriceCard(price: '20')
                      ],
                    ),
                    Row(
                      children: [
                       const TextBrandTitle(text: 'Stock', textSize:TextSizes.small,textColor: TColors.black),
                       const SizedBox(width: TSizes.spaceBtwItems),
                       Text('In Stock', style: Theme.of(context).textTheme.titleMedium)
                      ],
                    ),
                  ]),
                ],
              ),
              //description
              const TextBrandTitle(text:'This is the description of the product and it can go upto max 4 lines',textSize: TextSizes.small,textColor: TColors.black,maxLines: 4,textAlign: TextAlign.start, )
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems ),

        //attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [ 
              ChoiceChips(text:'Green',selected: true,onSelected: (value){},),
              ChoiceChips(text:'Blue',selected: false,onSelected: (value){}),
              ChoiceChips(text:'Yellow',selected: false,onSelected: (value){}),
              ChoiceChips(text:'Red',selected: false,onSelected: (value){},),
              ChoiceChips(text:'Purple',selected: false,onSelected: (value){}),
              ChoiceChips(text:'Orange',selected: false,onSelected: (value){})
              ],
            )
          
          ],
        ),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [ 
                ChoiceChips(text:'EU 34',selected: true,onSelected: (value){},),
                ChoiceChips(text:'EU 36',selected: false,onSelected: (value){}),
                ChoiceChips(text:'EU 38',selected: false,onSelected: (value){})
              ],
            )
            
          ],
        )

      ],
    );
  }
}


