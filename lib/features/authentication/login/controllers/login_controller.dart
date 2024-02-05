import 'package:acomerlapp/data/repositories/repositories.authentication/authentication/authentication_repository.dart';
import 'package:acomerlapp/features/authentication/signup/screens/signup.dart';
import 'package:acomerlapp/features/personalization/controller/user_controller.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/helpers/network_manager.dart';
import 'package:acomerlapp/utils/popups/fullScreen_loader.dart';
import 'package:acomerlapp/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  final localStorage = GetStorage();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
       

         
    if(localStorage.read('REMEMBERME_EMAIL') != null){
      email.text = localStorage.read('REMEMBERME_EMAIL');
      password.text = localStorage.read('REMEMBERME_PASSWORD');
      rememberMe.value = true;
    }
    super.onInit();
  }

  void goToSignup(){
    Get.offAll(const SignupWidget());
  }



  //login with email and password
  void loginWithEmailAndPassword() async {
    try {
      //check connection
    final bool isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected){
      return;
    }

    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    //remember me
    if(rememberMe.value){
      localStorage.write('REMEMBERME_EMAIL', email.text.trim());
      localStorage.write('REMEMBERME_PASSWORD', password.text.trim());
    }else{
      localStorage.remove('REMEMBERME_EMAIL');
      localStorage.remove('REMEMBERME_PASSWORD');
    }
    //start loading
    TFullScreenLoader.openLoadingDialog('Signing in...', TImages.loaderAnimation);

    //Firebase Login
     final userCredential = await AuthenticationRespositorie.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

     TLoaders.successSnackBar(title: "Welcome", message: '${userCredential.user!.email}');

    //stop loading
    TFullScreenLoader.closeLoadingDialog();

    //redirect to the next screen
    AuthenticationRespositorie.instance.screenRedirect();
 
    } catch (e) {
      TFullScreenLoader.closeLoadingDialog();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
    
  }

  void googleSignIn() async {
    try {
        //start loading
       
    TFullScreenLoader.openLoadingDialog('Signing in...', TImages.loaderAnimation);
      //check connection
        
    final bool isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected){
       TFullScreenLoader.closeLoadingDialog();
      return;
    }

  

    //Firebase Google Sign In
    final userCredential = await AuthenticationRespositorie.instance.signInWithGoogle();

     //stop loading
     
    TFullScreenLoader.closeLoadingDialog();


    //show message
     TLoaders.successSnackBar(title: "Welcome", message: '${userCredential?.user!.email}');

    //save user data
    final userController = Get.put(UserController());
    await userController.saveUserRecord(userCredential);

    //redirect to the next screen
    AuthenticationRespositorie.instance.screenRedirect();

 
    } catch (e) {
      TFullScreenLoader.closeLoadingDialog();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}