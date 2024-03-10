import 'package:acomerlapp/common/widgets/cards/horizontal_card_images.dart';
import 'package:acomerlapp/common/widgets/cards/vertical_card.dart';
import 'package:acomerlapp/common/widgets/layouts/grid_layout.dart';
import 'package:acomerlapp/common/widgets/texts/sectionc_header.dart';
import 'package:acomerlapp/features/details_items/item_details.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentOfTab extends StatelessWidget {
  const ContentOfTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:[ Padding(
         padding: const EdgeInsets.all(TSizes.defaultSpace),
         child: Column(
           children:[
             //brands
             const HorizontalCardWithImages(images:[TImages.productImage1,TImages.productImage10,TImages.productImage9]),
              const SizedBox(height:TSizes.spaceBtwItems),
             //products
            const TSectionHeading(title:"You might like", buttonTitle: "View all", showActionButton: true),
      
            GridLayout(itemCount: 4, itemBuilder:(_, index) =>  VerticalCard(image: TImages.productImage1,  onPressed:() => {Get.to(() => const DetailScreen())}) )
           ]
         )
       ),
      ]
    );
  }
}