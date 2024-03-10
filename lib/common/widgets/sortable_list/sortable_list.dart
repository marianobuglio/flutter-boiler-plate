import 'package:acomerlapp/common/widgets/cards/vertical_card.dart';
import 'package:acomerlapp/common/widgets/layouts/grid_layout.dart';
import 'package:acomerlapp/features/details_items/item_details.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SortableItems extends StatelessWidget {
  const SortableItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        //DropDown
        DropdownButtonFormField(
          decoration:  InputDecoration(
          labelText: 'Sort by',
          prefixIcon: Icon(Iconsax.sort),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius) , 
          ),
          ),
          items: ['name', 'price', 'rating', 'discount'].map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value){}
        ),
    
        const SizedBox(height: TSizes.spaceBtwSections),
        GridLayout(itemCount: 10, itemBuilder: (_,index){ return VerticalCard(image: TImages.productImage1, onPressed:() => {Get.to(() => const DetailScreen())});})
      ]
    );
  }
}