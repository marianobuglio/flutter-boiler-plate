import 'package:acomerlapp/common/widgets/divider_widget.dart';
import 'package:acomerlapp/common/widgets/social_buttons.dart';
import 'package:acomerlapp/features/authentication/signup/screens/widgets/signup_form.widget.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/constants/text_strings.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              //form
              SignupForm(dark: dark),
              const SizedBox(height: TSizes.spaceBtwSections),
              //divider
              DiverWidget(dark: dark, text: TTexts.orSignUpWith),
              const SizedBox(height: TSizes.spaceBtwSections),
              //social buttons
              SocialButtons(dark: dark),
            ],
          ),
        ),
      ),
    );
  }
}


