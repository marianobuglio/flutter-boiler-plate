import 'package:acomerlapp/common/widgets/appbar/appbar.dart';
import 'package:acomerlapp/common/widgets/rating/rating_indicator.dart';
import 'package:acomerlapp/features/item_review/widgets/overall_item_rating.dart';
import 'package:acomerlapp/features/item_review/widgets/user_review_card.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ItemReviewScreen extends StatelessWidget {
  const ItemReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              const Text("Ratings and reviews are verified and are from people who use the same type og device that you use"),
              const SizedBox(height: TSizes.spaceBtwItems),
              //Overall item rating
              const OverallItemRating(),
              const RaitingBarIndicator(value:3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),
              // user Reviews
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard()

            ],
          ),
        )
      ),
    );
  }
}





