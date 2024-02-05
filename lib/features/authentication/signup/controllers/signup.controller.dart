



import 'package:acomerlapp/data/repositories/repositories.authentication/authentication/authentication_repository.dart';
import 'package:acomerlapp/data/repositories/user/user_repository.dart';
import 'package:acomerlapp/features/authentication/signup/models/User.dart';
import 'package:acomerlapp/features/authentication/signup/screens/verify_email.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/helpers/network_manager.dart';
import 'package:acomerlapp/utils/logging/logger.dart';
import 'package:acomerlapp/utils/popups/fullScreen_loader.dart';
import 'package:acomerlapp/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController {
  static SignUpController get intance => Get.find();

  /// variables
  final termsConditions = true.obs;
  final hiddenPassword = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  /// SignUp
  

void signUp() async {
    try {
      //start loading


      //check connection

      final bool isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        return;
      }

      //Form Validation
      if (!formKey.currentState!.validate()) {
        return;
      }

      if(!termsConditions.value){
        TLoaders.warningSnackBar(title: "Privacy Policy", message: 'Please accept terms and conditions');
        return;
      }
      TFullScreenLoader.openLoadingDialog('Signing up...', TImages.loaderAnimation);

    //Firebase SignUp
     final userCredential =  await AuthenticationRespositorie.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

    //Fire store
    final newUser = UserModel(
      id: userCredential.user!.uid ,
      firstName: firstName.text.trim(), 
      lastName: lastName.text.trim(), 
      username: username.text.trim(), 
      email: email.text.trim(), 
      phone: phone.text.trim(), 
      password: password.text.trim(),
      profileImage: ''
    );

    final  userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser);

    TFullScreenLoader.closeLoadingDialog();
   
    TLoaders.successSnackBar(title: 'Success', message: 'User created successfully');

    Get.to(() =>  VerifyEmail(email: newUser.email));
  
    } catch (e) {
      TFullScreenLoader.closeLoadingDialog();
      TLoggerHelper.error(e.toString());
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } 
  }
  
}