import 'package:acomerlapp/features/authentication/login/controllers/login_controller.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ 
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
            color: dark ? TColors.light : TColors.grey,
          ),
          child:IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              image: AssetImage(TImages.google),
              height: TSizes.iconMd,
              width: TSizes.iconMd
            ),
          )
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
            color: dark ? TColors.light : TColors.grey,
          ),
          child:IconButton(
            onPressed: (){},
            icon: const Image(
              image: AssetImage(TImages.facebook),
              height: TSizes.iconMd,
              width: TSizes.iconMd
            ),
          )
        )
      ],
    );
  }
}