import 'package:acomerlapp/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:acomerlapp/common/widgets/images/rounded_images.dart';
import 'package:acomerlapp/features/home/controller/home_controller.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
     final controller  = Get.put(HomeController());

    return Column(
      children: [ 
      CarouselSlider(
        items: [
          for (final banner in banners)
          TRoundedImage(imageUrl: banner),
         
        ],
        options: CarouselOptions(
          viewportFraction: 1,
          onPageChanged: (index, _) => controller.changeCarouselIndex(index),
        ),
      ),
      const SizedBox(height: TSizes.spaceBtwItems),
      Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          for (int i = 0; i < banners.length; i++)
              TCircularContainer(
                width: 20,
                height: 4,
                backgroundColor: i == controller.carouselIndex.value ? TColors.primary : TColors.grey,
                margin: const EdgeInsets.only(right: 10),

              ),
              
          ],
        ),
      )
      ]
    );
  }
}