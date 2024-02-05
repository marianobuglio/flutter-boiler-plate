import 'package:acomerlapp/features/authentication/login/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class onBoardingController extends GetxController{
  static onBoardingController get instance => Get.find();

  /// variables
  final pageController = PageController();
  Rx<int> currentpageIndex = 0.obs;

  /// Update current index when page scroll
  void updatePageIndicator(index){
    currentpageIndex.value = index;
  }
  /// Jums to the specific dot selected page
  void dotNavigationClick(index){
    currentpageIndex.value = index;
    pageController.jumpToPage(index);
  }
  /// Update selected index and jump to next page
  void nextPage(){
    if(currentpageIndex.value == 2){
      final deviceStorage = GetStorage();
      deviceStorage.write('isFirstTime', 'false');
      Get.offAll(const LoginScreen());
    }
    currentpageIndex.value =  currentpageIndex.value + 1;
    pageController.jumpToPage(currentpageIndex.value);
  }
  /// Update current index and jump to last page
  void skipPage(){
    currentpageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}