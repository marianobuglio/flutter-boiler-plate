import 'package:acomerlapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:acomerlapp/common/widgets/rating/rating_indicator.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Column(
      children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            Row(
            children: [ 
              const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1)),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text("Eva Smith", style: Theme.of(context).textTheme.titleLarge),  
            ],
          ),
           IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ]
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Row(
          children:[
            const RaitingBarIndicator(value: 3.5),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('01 nov, 2022', style: Theme.of(context).textTheme.bodyMedium),
          ]
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        const ReadMoreText(
          "I love this product. It is very good. I will buy it again, it is very good. I will buy it again, it is very good. I will buy it again, it is very good. I will buy it again, it is very good. I will buy it again, it is very good.",
          trimLength: 100,
          colorClickableText: TColors.primary,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: TColors.primary
          ),
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: TColors.primary
          ),
        ),
        TRoundedContainer(
          color: dark ? TColors.darkGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(children: [ 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [             
                  Text("T's Store", style: Theme.of(context).textTheme.titleMedium),
                  Text('02 Nov, 2024', style: Theme.of(context).textTheme.bodyMedium)
                ],
              ),
               const ReadMoreText(
          "I love this product. It is very good. I will buy it again, it is very good. I will buy it again, it is very good. I will buy it again, it is very good. I will buy it again, it is very good. I will buy it again, it is very good.",
          trimLength: 100,
          colorClickableText: TColors.primary,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: TColors.primary
          ),
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: TColors.primary
          ),
        )
            ]),
          )
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        //Text("I love this product. It is very good. I will buy it again.", style: Theme.of(context).textTheme.bodyMedium),
      ]
    );
  }
}