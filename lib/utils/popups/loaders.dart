
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class TLoaders {
  static successSnackBar({required  title, message = '',duration = 3}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      backgroundColor: TColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: TColors.white)
    );
  }

  static warningSnackBar({required  title, message = ''}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: TColors.warning,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: TColors.white)
    );
  }

  static errorSnackBar({required  title, message = ''}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: TColors.error,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: TColors.white)
    );
  }
}
