import 'package:acomerlapp/common/widgets/cards/horizontal_card.dart';
import 'package:acomerlapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HorizontalCardWithImages extends StatelessWidget {
  const HorizontalCardWithImages({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        color: dark ? TColors.dark : TColors.light,
        margin: const EdgeInsets.only(bottom: TSizes.defaultSpace),
        child: Column(children: [
          const HorizontalCard(
              image: TImages.nikeLogo, title: "Nike", subtitle: "25 products"),
          Row(
            children: images
                .map((image) => imagesHorizontalCard(image, context))
                .toList(),
          )
        ]));
  }

  Expanded imagesHorizontalCard(String image, BuildContext context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(TSizes.md),
        color:THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
        borderColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
        showBorder: true,
        margin: const EdgeInsets.only(right: TSizes.sm),
        child:  Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}
