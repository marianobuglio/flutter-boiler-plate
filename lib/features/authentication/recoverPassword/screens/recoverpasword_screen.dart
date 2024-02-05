import 'package:acomerlapp/features/authentication/recoverPassword/controllers/recoverPassword.controller.dart';
import 'package:acomerlapp/features/authentication/recoverPassword/screens/verify_email_pasword.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/constants/text_strings.dart';
import 'package:acomerlapp/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RecoverPassScreen extends StatelessWidget {
  const RecoverPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecoverPasswordController());
    return   Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
          padding: const  EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Text(
                TTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
             const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Form(
                key: controller.recoverPasswordForm,
                child: Column(
                  children:[
                    TextFormField(
                      controller: controller.email,
                      validator: (value) => TValidator.validateEmail(value),
                      decoration: InputDecoration(
                        labelText: TTexts.email,
                        hintText: TTexts.email,
                        prefixIcon: const Icon(Iconsax.direct_right),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>  controller.sendEmail(),
                        child: const Text(TTexts.submit),
                      ),
                    ),
                  ]
                )
              )
            ],
          ),
      )
    );
  }
}