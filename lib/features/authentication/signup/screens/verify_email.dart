import 'package:acomerlapp/data/repositories/repositories.authentication/authentication/authentication_repository.dart';
import 'package:acomerlapp/features/authentication/signup/controllers/verify_email.controller.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/constants/text_strings.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key,  this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [ 
          IconButton(
            onPressed: () => AuthenticationRespositorie.instance.logout(),
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
              TTexts.confirmEmail,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              email ?? '',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TTexts.confirmEmailSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            ///Buttons
            const SizedBox(height: TSizes.spaceBtwItems),
             SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.manualEmailVerification(),
                child:  Text(
                  TTexts.tContinue,
                  style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () async => controller.sendEmailVerification(),
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