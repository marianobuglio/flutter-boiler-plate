import 'package:acomerlapp/common/widgets/appbar/appbar.dart';
import 'package:acomerlapp/common/widgets/cards/vertical_card.dart';
import 'package:acomerlapp/common/widgets/icons/rounded_icon.dart';
import 'package:acomerlapp/common/widgets/layouts/grid_layout.dart';
import 'package:acomerlapp/features/details_items/item_details.dart';
import 'package:acomerlapp/features/home/home.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(title:Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
      actions: [
        TRoundedIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()))
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace) ,
          child: Column(
            children: [
              GridLayout(itemCount: 5, itemBuilder: (_,index){ return VerticalCard(image: TImages.productImage15, onPressed:() => {Get.to(() => const DetailScreen())});})
            ],
          ),
        )
      ),
    );
  }
}