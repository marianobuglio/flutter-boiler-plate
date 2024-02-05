import 'package:acomerlapp/common/style/spacing_styles.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.animation, required this.title, required this.subTitle, required this.onPressed});
  final animation, title, subTitle;
  final VoidCallback onPressed ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding : TSpacingStyle.defaultPadding,
          child: Column(
           
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
            ///Image
            Lottie.asset(animation),
            const SizedBox(height: TSizes.spaceBtwSections),
            ///Title & subtitle
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            ///Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Text(TTexts.tContinue),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            ],
          ),
        )
      )
    );
  }
}