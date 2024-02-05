import 'package:acomerlapp/features/authentication/login/controllers/login_controller.dart';
import 'package:acomerlapp/features/authentication/recoverPassword/screens/recoverpasword_screen.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/constants/text_strings.dart';
import 'package:acomerlapp/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller  = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child:Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            ///Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: InputDecoration(
                labelText: TTexts.email,
                prefixIcon: const Icon(Iconsax.direct_right),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            ///Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validateEmptyString('password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon : Icon(controller.hidePassword.value ? Iconsax.eye_slash :  Iconsax.eye),
                   ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
        
            /// remember me and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember me
                Obx(
                  () => Checkbox(
                    value: controller.rememberMe.value,
                    onChanged: (value) => controller.rememberMe.value = value!,
                  ),
                ),
                const Text(TTexts.rememberMe),
                const Spacer(),
                ///Forgot password
                TextButton(
                  onPressed: () { Get.to(const RecoverPassScreen());},
                  child: Text(
                    TTexts.forgetPassword,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            ///Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>  controller.loginWithEmailAndPassword(),
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            ///Create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: controller.goToSignup,
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      )
    );
  }
}