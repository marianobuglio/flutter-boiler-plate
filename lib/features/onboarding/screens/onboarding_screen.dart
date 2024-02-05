import 'package:acomerlapp/features/onboarding/controller/onboarding_controller.dart';
import 'package:acomerlapp/features/onboarding/screens/widgets/onBoardingCircularButton.dart';
import 'package:acomerlapp/features/onboarding/screens/widgets/onBoardingPage.dart';
import 'package:acomerlapp/features/onboarding/screens/widgets/onBoardingPageNavigation.dart';
import 'package:acomerlapp/features/onboarding/screens/widgets/skipWidget.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});


  @override
  Widget build(BuildContext context) {
     final controller  = Get.put(onBoardingController());

    return  Scaffold(
      body: Stack(
        children: [
        /// horizontal Scrollables pages
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnBoardingPage(
              image: TImages.onBoardingImage1,
              title: TTexts.onBoardingTitle1,
              subTitle: TTexts.onBoardingSubTitle1
            ),
            OnBoardingPage(
              image: TImages.onBoardingImage2,
              title: TTexts.onBoardingTitle2,
              subTitle: TTexts.onBoardingSubTitle2
            ),
            OnBoardingPage(
              image: TImages.onBoardingImage3,
              title: TTexts.onBoardingTitle3,
              subTitle: TTexts.onBoardingSubTitle3
            ),
          ],
        ),
        /// Skip Button
        const SkipWidget(),
        /// Dot navigation Smoothpageindicator
        const OnBoardingPageNavigation(),
        /// Circular Button
        const OnBoardingCircularButton()
        ],
   
      )
    );
  }
}







