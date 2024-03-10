import 'package:acomerlapp/common/widgets/texts/sectionc_header.dart';
import 'package:acomerlapp/features/details_items/widgets/bottom_navigation_bar.dart';
import 'package:acomerlapp/features/details_items/widgets/item_atributes.dart';
import 'package:acomerlapp/features/details_items/widgets/item_detail_image.dart';
import 'package:acomerlapp/features/details_items/widgets/item_metadata.dart';
import 'package:acomerlapp/features/details_items/widgets/rating_share.dart';
import 'package:acomerlapp/features/item_review/item_review.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      bottomNavigationBar: const ItemBotomNavigationBar() ,
      body: SingleChildScrollView(
        child: Column(
          children:[
            /// Item image Slider
             const ItemDetailImage(),
            ///Item details
            Padding(
              padding: const EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating && Share Button
                  const RatingAndShare(),
                  /// Price Title, Stock & brand
                  const ItemMetaData(),
                  /// Atributtes
                  const Attributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  /// Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed:(){}, child: const Text('checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Description
                 const TSectionHeading(title: 'Description', showActionButton: false),
                 const SizedBox(height: TSizes.spaceBtwItems),
                 const ReadMoreText(' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ut nisl id tortor aliquet tincidunt. Donec in metus quis sem gravida luctus.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' less',
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
                  /// Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(title: 'Reviews(199)', onPressed: () => Get.to(const ItemReviewScreen()),showActionButton: false),
                      IconButton(onPressed: () => Get.to(const ItemReviewScreen()), icon: const Icon(Iconsax.arrow_right_3))
                    ]
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ]
              ),
            )
          ]
        )
      )
    );
  }
}



