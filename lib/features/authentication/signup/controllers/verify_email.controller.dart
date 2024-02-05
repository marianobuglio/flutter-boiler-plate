



import 'dart:async';

import 'package:acomerlapp/common/widgets/success_screen/success_screen.dart';
import 'package:acomerlapp/data/repositories/repositories.authentication/authentication/authentication_repository.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/text_strings.dart';
import 'package:acomerlapp/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();
  
  @override
  void onInit(){
    super.onInit();
    sendEmailVerification();
    setTimeoutToRedirect();
    
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRespositorie.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: "Email Verification", message: "We have sent you an email to verify your account, please check your inbox");

    } catch (e) {
      TLoaders.errorSnackBar(title: "Ups", message: e.toString());
    }
  }


  /// Timer to redirect to success screen
  setTimeoutToRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async{ 
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(() =>  SuccessScreen(
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          animation: TImages.successAnimation,
          onPressed: () => AuthenticationRespositorie.instance.screenRedirect()
        )
        );
      }
    });
  }

  manualEmailVerification(){
    final currentUser = FirebaseAuth.instance.currentUser;

    if(currentUser != null && currentUser.emailVerified){
      Get.off(
        () =>  SuccessScreen(
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          animation: TImages.successAnimation,
          onPressed: () => AuthenticationRespositorie.instance.screenRedirect()
        )
      );
    }else{
      TLoaders.successSnackBar(title: "Email Verification", message: "We have sent you an email to verify your account, please check your inbox");
    }
  }
}