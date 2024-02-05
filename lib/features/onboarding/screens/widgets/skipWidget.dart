import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:acomerlapp/features/onboarding/controller/onboarding_controller.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = onBoardingController.instance;
    return Positioned(
      top:TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
              onPressed: controller.nextPage,
              child: const Text('Skip'))
    );
    
  }
}