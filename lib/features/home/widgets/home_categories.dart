import 'package:acomerlapp/common/widgets/image_text_widegts/image_vertical.dart';
import 'package:acomerlapp/common/widgets/texts/sectionc_header.dart';
import 'package:acomerlapp/features/subCategories/sub_categories.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          ///heading
          const TSectionHeading( title: 'Categorias', buttonTitle: 'Ver todo', showActionButton: true, color: TColors.white),
          const SizedBox(height: TSizes.spaceBtwItems / 2 ),
          ///categories
          SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 12,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
               return  TVerticalImageText(image: TImages.jeweleryIcon, title: 'Comida', onTap:() =>  Get.to(() => const subCategoryScreen()));
              },
            ),
          )
        ],
      )
    );
  }
}