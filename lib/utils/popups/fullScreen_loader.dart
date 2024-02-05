




import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TFullScreenLoader {
  
  static void openLoadingDialog(String text, String animation){
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child:Container(
          color:THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children:[
              const SizedBox(height: 250),
              Lottie.asset(animation),
              Text(text,style: Theme.of(Get.context!).textTheme.bodyMedium,)
            ]
          ),
        )
       
      )
    );
  }

  static closeLoadingDialog(){
    Navigator.of(Get.overlayContext!).pop();
  }
}