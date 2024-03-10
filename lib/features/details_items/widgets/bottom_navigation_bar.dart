import 'package:acomerlapp/common/widgets/icons/rounded_icon.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class  ItemBotomNavigationBar extends StatelessWidget {
  const ItemBotomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return   Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration( 
        color: dark ? TColors.darkGrey : TColors.light,
        borderRadius: const  BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ 
          Row(
            children: [ 
              const TRoundedIcon(
                icon: Iconsax.minus, 
                height: 40,
                width: 40,
                backgroundColor: TColors.darkGrey,
                color: TColors.white,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: TSizes.spaceBtwItems),
              const TRoundedIcon(
                icon: Iconsax.add, 
                height: 40,
                width: 40,
                backgroundColor: TColors.black,
                color: TColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
            child: const Text('Add to cart')),
        ],
      )
    );
  }
}