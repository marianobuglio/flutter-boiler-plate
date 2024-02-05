import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/device/device_utility.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:acomerlapp/features/onboarding/controller/onboarding_controller.dart';


class OnBoardingCircularButton extends StatelessWidget {
  const OnBoardingCircularButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = onBoardingController.instance;
    final  dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      right: TSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: controller.nextPage,
        style:ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColors.primary : TColors.black,
        ),
        child: const Icon(Iconsax.arrow_right_3) ,
      )
    );
  }
}
