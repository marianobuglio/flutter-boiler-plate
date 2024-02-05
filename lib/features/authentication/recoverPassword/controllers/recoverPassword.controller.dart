import 'package:acomerlapp/data/repositories/repositories.authentication/authentication/authentication_repository.dart';
import 'package:acomerlapp/features/authentication/recoverPassword/screens/verify_email_pasword.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/text_strings.dart';
import 'package:acomerlapp/utils/helpers/network_manager.dart';
import 'package:acomerlapp/utils/popups/fullScreen_loader.dart';
import 'package:acomerlapp/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPasswordController extends GetxController {
  static RecoverPasswordController get instance => Get.find();


  ///variables
  final email = TextEditingController();
  final GlobalKey<FormState> recoverPasswordForm = GlobalKey<FormState>();
  
  Future<void> sendEmail() async {
    try {
     

      //test connection
       final bool isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        TLoaders.warningSnackBar(title: TTexts.noInternetConnection, message: TTexts.noInternetConnectionMessage);
        return;
      }

      //Form Validation
      if (!recoverPasswordForm.currentState!.validate()) {
        return;
      }
      // load loading
      TFullScreenLoader.openLoadingDialog(TTexts.resendEmail, TImages.loaderAnimation);

      // send email
      await AuthenticationRespositorie.instance.sendPasswordResetEmail(email.text.trim());
      // hide loading

      TFullScreenLoader.closeLoadingDialog();

      TLoaders.successSnackBar(title:TTexts.passwordResetEmailSentTitle, message: TTexts.passwordResetEmailSentMessage);
      // redirect
      Get.to(VerifyEmailPassword(email:email.text.trim()));

    } catch (e) {
      TFullScreenLoader.closeLoadingDialog();
      TLoaders.errorSnackBar(title:"Ups!", message: e.toString());
    }
  }
  
}
