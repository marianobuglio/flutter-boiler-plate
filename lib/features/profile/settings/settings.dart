import 'package:acomerlapp/common/widgets/appbar/appbar.dart';
import 'package:acomerlapp/common/widgets/custom_shapes/containers/primary_header.dart';
import 'package:acomerlapp/common/widgets/list_tiles/setting_menu.dart';
import 'package:acomerlapp/common/widgets/list_tiles/user_profile.dart';
import 'package:acomerlapp/common/widgets/texts/sectionc_header.dart';
import 'package:acomerlapp/features/profile/profile.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
           TPrimaryHeader(
            height: 230,
            child: 
            Column(
              children: [
                  TAppBar(title:Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),
                  UserProfile(onPressed:() => {Get.to(() => const ProfileScreen())}),
              ],
            )
           ),
           ///Body
           Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TSectionHeading(title: "Account", showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                SettingMenuTile(icon: Iconsax.user_cirlce_add4, title: 'Personal Information', subtitle: 'Edit your personal information',onTap: (){},),
                SettingMenuTile(icon: Iconsax.password_check,title: 'Change Password', subtitle: 'Change your password',onTap: (){}),
                SettingMenuTile(icon: Iconsax.notification4,title: 'Notification', subtitle: 'Manage your notifications',onTap: (){}),
                SettingMenuTile(icon: Iconsax.people,title: 'About Us', subtitle: 'Learn more about us',onTap: (){}),
                SettingMenuTile(icon: Iconsax.logout,title: 'Logout', subtitle: 'Logout from your account',onTap: (){}),
                
                const SizedBox(height: TSizes.spaceBtwItems),

                const TSectionHeading(title: "App settings", showActionButton: false),
                
                const SizedBox(height: TSizes.spaceBtwItems),
                SettingMenuTile(icon: Iconsax.info_circle, title: 'About', subtitle: 'Learn more about the app',onTap: (){}),
                SettingMenuTile(icon: Iconsax.heart, title: 'Rate Us', subtitle: 'Rate our app',onTap: (){}),
                SettingMenuTile(icon: Iconsax.share, title: 'Share', subtitle: 'Share our app',onTap: (){}),
                SettingMenuTile(icon: Iconsax.location, title: 'Geolocation', subtitle: 'Set recomendation on location',onTap: (){}, trailing: Switch(value: true, onChanged: (value) {})),
                SettingMenuTile(icon: Iconsax.image, title: 'HD Image quality', subtitle: 'activate the HD image',onTap: (){}, trailing: Switch(value: false, onChanged: (value) {})),


              ]
            ) ,

           )
          ],
        ),
      )
    );
  }
}

class TSettingMenuTile {
}
