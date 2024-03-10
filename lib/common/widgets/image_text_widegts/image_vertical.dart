import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key, required this.title, required this.image,  this.textColor = Colors.white, this.backgroundColor, this.onTap,
  });


  final String title, image;
  final Color textColor ;
  final Color? backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark =  THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
         padding: const  EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
           children: [
             Container(
               width: 56,
               height: 56,
               padding: const EdgeInsets.all(TSizes.md),
               decoration: BoxDecoration(
                 color: backgroundColor ?? (dark ? TColors.black : TColors.white),
                 borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
               ),
               child: Image(image: AssetImage(image), fit: BoxFit.cover, color:(dark ? TColors.light : TColors.dark)),
             ),
             const SizedBox(height: TSizes.spaceBtwItems / 2),
             SizedBox(
             width: 55 , 
             child: Text(
               title, 
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.white)
               )
             ),
           ],
         ),
      ),
    );
  }
}