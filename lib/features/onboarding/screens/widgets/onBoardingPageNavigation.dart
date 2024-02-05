import 'package:acomerlapp/features/onboarding/controller/onboarding_controller.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/device/device_utility.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPageNavigation extends StatelessWidget {
  const OnBoardingPageNavigation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {

    final controller = onBoardingController.instance;
    final  dark =THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child:SmoothPageIndicator(
        controller: controller.pageController, 
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect:  ExpandingDotsEffect(
          activeDotColor: dark ? TColors.light : TColors.black,
          dotHeight: 6
        ),
        )
    );
  }
}