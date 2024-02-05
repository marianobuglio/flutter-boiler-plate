import "package:acomerlapp/common/style/spacing_styles.dart";
import "package:acomerlapp/common/widgets/divider_widget.dart";
import "package:acomerlapp/features/authentication/login/screens/widgets/form_login.dart";
import "package:acomerlapp/features/authentication/login/screens/widgets/header_login.dart";
import 'package:acomerlapp/common/widgets/social_buttons.dart';
import "package:acomerlapp/utils/constants/sizes.dart";
import "package:acomerlapp/utils/constants/text_strings.dart";
import "package:acomerlapp/utils/helpers/helper_functions.dart";
import "package:flutter/material.dart";


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.defaultPadding,
          child: Column(
            ///logo, title and subtitle
            children: [
              HeaderLogin(dark: dark),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              ///login form
              const FormLogin(),
              ///Divider
              DiverWidget(dark: dark, text: TTexts.orSignInWith,),
              const SizedBox(height: TSizes.spaceBtwItems),
              ///Social login
              SocialButtons(dark: dark)
            ],
            
          ),
        ),
      )
    );
  }
}







