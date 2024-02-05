import 'package:acomerlapp/common/widgets/success_screen/success_screen.dart';
import 'package:acomerlapp/features/authentication/login/screens/login.dart';
import 'package:acomerlapp/features/authentication/recoverPassword/controllers/verify_email_password.controller.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/constants/text_strings.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailPassword extends StatelessWidget {
  const VerifyEmailPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final controller  = Get.put(VerifyEmailPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [ 
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body:   SingleChildScrollView(
        child: Padding(
          padding:const   EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
            ///Image
            Image(
              image: const AssetImage(TImages.deliveredEmailIllustration),
              width: THelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            ///Title & subtitle
            Text(
              TTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              email,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            ///Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){ Get.offAll(() => const LoginScreen());},
                child: const Text(TTexts.tContinue),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => controller.reSendEmail(email),
                child:  Text(
                  TTexts.resendEmail,
                  style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ),
            ),

            ],
        ),
      ),
      ),
    );
  }
}