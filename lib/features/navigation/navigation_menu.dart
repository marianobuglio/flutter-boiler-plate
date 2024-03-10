import 'package:acomerlapp/features/home/home.dart';
import 'package:acomerlapp/features/profile/settings/settings.dart';
import 'package:acomerlapp/features/screenOne%20(store)/screenOne.dart';
import 'package:acomerlapp/features/secondScreen%20(wishlist)/secondScreen.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      () => Scaffold(
        bottomNavigationBar: 
         NavigationBar(  
            height: 80,
            elevation: 0,
            selectedIndex: navigationController._selectedIndex.value,
            onDestinationSelected: (index) => navigationController._selectedIndex.value = index,
            backgroundColor: dark ? Colors.black : Colors.white,
            indicatorColor: dark ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.1),
            destinations: const  [
               NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
               NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
               NavigationDestination(icon: Icon(Iconsax.heart), label: 'wishlist'),
               NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
        ),
        body: navigationController.screens[navigationController._selectedIndex.value],
      ),
    );
  }
}


class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();

  final Rx<int> _selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const ScreenOne(),
    const SecondScreen(),
    const SettingsScreen()
    ];
}