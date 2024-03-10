import 'package:acomerlapp/common/widgets/cards/vertical_card.dart';
import 'package:acomerlapp/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:acomerlapp/common/widgets/layouts/grid_layout.dart';
import 'package:acomerlapp/common/widgets/texts/sectionc_header.dart';
import 'package:acomerlapp/features/all_Items/all_items.dart';
import 'package:acomerlapp/features/details_items/item_details.dart';
import 'package:acomerlapp/features/home/widgets/home_appbar.dart';
import 'package:acomerlapp/common/widgets/custom_shapes/containers/primary_header.dart';
import 'package:acomerlapp/features/home/widgets/home_categories.dart';
import 'package:acomerlapp/features/home/widgets/promo_slider.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           const TPrimaryHeader( 
              height: 400,
              child :
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                    ///appbar
                    THomeAppBar(),
                    SizedBox(height: TSizes.spaceBtwSections),
                    ///search container
                    TSearchContainer(showBackground: true, showBorder: true),
                    SizedBox(height: TSizes.spaceBtwItems),
                    /// Categories
                    THomeCategories(),
              ]
            )
            ),
             Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                  children: [
                    const PromoSlider(banners: [TImages.promoBanner1,TImages.promoBanner2,TImages.promoBanner3, TImages.banner4]),
                    const SizedBox(height: TSizes.spaceBtwSections),
                     TSectionHeading( title: 'Favorites Products', showActionButton: true,  onPressed: () => { Get.to(const AllItemsScreen()) },),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    GridLayout(itemCount: 6, itemBuilder: (_, index) =>  VerticalCard(image:  TImages.productImage1, onPressed:() => {Get.to(() => const DetailScreen())}))
                   
                  ]
                ),
            )
          ],
        )
      ),
      
    );
  }
}





















