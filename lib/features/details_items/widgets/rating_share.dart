import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      //rating
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [ 
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "4.5", style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: " (120)"),
                ]
              )
            )
          ],
        ),
        IconButton(onPressed: (){}, icon: const Icon(Icons.share, size: TSizes.iconMd))
      ],
    );
  }
}