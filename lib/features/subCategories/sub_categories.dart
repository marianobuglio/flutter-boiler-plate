import 'package:acomerlapp/common/widgets/appbar/appbar.dart';
import 'package:acomerlapp/common/widgets/cards/horizontal_card_item.dart';
import 'package:acomerlapp/common/widgets/images/rounded_images.dart';
import 'package:acomerlapp/common/widgets/texts/sectionc_header.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class subCategoryScreen extends StatelessWidget {
  const subCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(
        title: Text('Sport '),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [ 
              // Banner
              const TRoundedImage(width: double.infinity, imageUrl: TImages.promoBanner3, applyImageRadius: true),
              const SizedBox( height: TSizes.spaceBtwSections),

              /// Sub-category
              Column(
                children: [
                  TSectionHeading(title: 'Sport shirts', showActionButton: false, onPressed: (){}),
                  const SizedBox(height: TSizes.spaceBtwItems / 2 ),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder:(context,index)  {return const SizedBox(width: TSizes.spaceBtwSections);},
                      itemBuilder:(context,index)   {return const ItemHorizontalCard();}),
                  )

                
                ],
              )
            ],
          )
        )
      )
    );
  }
}