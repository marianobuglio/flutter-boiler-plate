import 'package:acomerlapp/features/authentication/login/screens/login.dart';
import 'package:acomerlapp/features/authentication/signup/controllers/signup.controller.dart';
import 'package:acomerlapp/features/authentication/signup/screens/widgets/termsConditions.widgets.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/constants/text_strings.dart';
import 'package:acomerlapp/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key:controller.formKey,
      child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.firstName,
                validator:(value) =>  TValidator.validateEmptyString('First Name', value),
                expands: false,
                decoration: InputDecoration(
                  labelText: TTexts.firstName,
                  prefixIcon: const Icon(Iconsax.user),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                        TSizes.inputFieldRadius),
                  ),
                ),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                controller: controller.lastName,
                validator: (value) => TValidator.validateEmptyString('Last Name', value),
                expands: false,
                decoration: InputDecoration(
                  labelText: TTexts.lastName,
                  prefixIcon: const Icon(Iconsax.user),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        TSizes.inputFieldRadius),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        TextFormField(
          controller: controller.username,
          validator: (value) => TValidator.validateEmptyString('Username', value),
          expands: false,
          decoration: InputDecoration(
            labelText: TTexts.username,
            prefixIcon: const Icon(Iconsax.user_edit),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(TSizes.inputFieldRadius),
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        TextFormField(
          controller: controller.email,
          validator: (value) => TValidator.validateEmail(value),
          expands: false,
          decoration: InputDecoration(
            labelText: TTexts.email,
            prefixIcon: const Icon(Iconsax.direct_right),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(TSizes.inputFieldRadius),
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        TextFormField(
          controller: controller.phone,
          validator: (value) => TValidator.validatePhoneNumber(value),
          expands: false,
          decoration: InputDecoration(
            labelText: TTexts.phoneNo,
            prefixIcon: const Icon(Iconsax.call),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(TSizes.inputFieldRadius),
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        Obx(
          () => TextFormField(
            controller: controller.password,
            validator:(value) => TValidator.validatePassword(value),
            expands: false,
            obscureText: controller.hiddenPassword.value,
            decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon:IconButton(
                onPressed: () => controller.hiddenPassword.value = !controller.hiddenPassword.value,
                icon:  Icon(controller.hiddenPassword.value ?  Iconsax.eye_slash :  Iconsax.eye) 
              ),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(TSizes.inputFieldRadius),
              ),
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        ///Terms and conditions
        const TermsConditions(),

        const SizedBox(height: TSizes.spaceBtwItems),
        ///Sign up button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed:() => controller.signUp(),
            child: const Text(TTexts.createAccount),
          ),
        ),
        ///sign in button
        const SizedBox(height: TSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () { Get.offAll(const LoginScreen());},
            child: const Text(TTexts.signIn),
          ),
        ),
      ],
    ));
  }
}

