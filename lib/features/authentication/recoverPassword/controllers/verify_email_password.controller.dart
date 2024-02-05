import 'package:acomerlapp/data/repositories/repositories.authentication/authentication/authentication_repository.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/text_strings.dart';
import 'package:acomerlapp/utils/helpers/network_manager.dart';
import 'package:acomerlapp/utils/popups/fullScreen_loader.dart';
import 'package:acomerlapp/utils/popups/loaders.dart';
import 'package:get/get.dart';

class VerifyEmailPasswordController extends GetxController {
  // Add your controller logic here
  static VerifyEmailPasswordController get instance => Get.find();
  
  Future<void> reSendEmail(String email) async {
     // send email

     try {

      //test connection
       final bool isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        TLoaders.warningSnackBar(title: TTexts.noInternetConnection, message: TTexts.noInternetConnectionMessage);
        return;
      }
        // load loading
      TFullScreenLoader.openLoadingDialog(TTexts.resendEmail, TImages.loaderAnimation);
       
      // send email
      await AuthenticationRespositorie.instance.sendPasswordResetEmail(email);


    
      // hide loading
      TFullScreenLoader.closeLoadingDialog();

      TLoaders.successSnackBar(title:TTexts.passwordResetEmailSentTitle, message: TTexts.passwordResetEmailSentMessage);
       
     } catch (e) {
        TFullScreenLoader.closeLoadingDialog();
        TLoaders.errorSnackBar(title:"Ups!", message: e.toString());
     }
  }
}
