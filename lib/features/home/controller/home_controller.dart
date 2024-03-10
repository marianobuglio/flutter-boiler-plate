import 'package:get/get.dart';

class HomeController extends GetxController {
 static HomeController get to => Get.find();
 

 final carouselIndex = 0.obs;

 void changeCarouselIndex(int index) {
   carouselIndex.value = index;
 }
}