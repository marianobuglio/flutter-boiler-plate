import 'package:acomerlapp/common/widgets/appbar/appbar.dart';
import 'package:acomerlapp/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:acomerlapp/common/widgets/icons/rounded_icon.dart';
import 'package:acomerlapp/common/widgets/images/rounded_images.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ItemDetailImage extends StatelessWidget {
  const ItemDetailImage({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedWidget(
      height: 300, 
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack (
          children:[
            
            ///Item image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Image(image: AssetImage(TImages.productImage1))
                  )
              )
            ),
    
            /// Scroll Images
            Positioned(

              bottom: 30,
              right: 0,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>  const SizedBox(width: TSizes.spaceBtwItems), 
                  itemBuilder: (_, context) =>
                  TRoundedImage(
                    imageUrl: TImages.productImage1,
                    height: 80,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    padding: const EdgeInsets.all(TSizes.sm),
                    border: Border.all(color: TColors.primary)
                  )
                ),
              ),
            ),
          
             const Positioned(
               top: 0,
               left: 0,
               right: 0,
               child: TAppBar(
                showBackButton: true,
                actions: [
                  TRoundedIcon(icon: Iconsax.heart5, color: Colors.red,)
                ],
              ),
             )
          ]
        ),
      ) 
    );
  }
}