import 'package:acomerlapp/common/widgets/appbar/appbar.dart';
import 'package:acomerlapp/common/widgets/images/circular_images.dart';
import 'package:acomerlapp/common/widgets/texts/sectionc_header.dart';
import 'package:acomerlapp/features/profile/widgets/profile_menu.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:acomerlapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
      ///AppBar
      appBar: TAppBar(
        title: Text('Profile', style: Theme.of(context).textTheme.headlineMedium!.apply(color: dark ? TColors.white : TColors.black),),
        showBackButton: true,
      ),
      ///Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///profile image
            SizedBox(
              width: double.infinity,
              child: Column(    
                children: [
                  const CircularImage(image: TImages.user,width: 80,height: 80,),
                  TextButton(child:const Text("Change profile image"), onPressed:(){})
                ],
              ),
            ),

            ///Details
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TSectionHeading(title: "Profile information", showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),
            ProfileMenu(title: 'name', value: "Mariano Buglio", onPressed: (){},),
            ProfileMenu(title: 'username', value: "marianobuglio", onPressed: (){},),

            ///Personal information
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TSectionHeading(title: "Personal information", showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            ProfileMenu(title: "User Id", value: '745', onPressed: (){}, icon: Iconsax.copy,),
            ProfileMenu(title: 'email', value: "marianobuglio@gmail", onPressed: (){},),
            ProfileMenu(title: 'phone', value: "+39 123456789", onPressed: (){},),
            ProfileMenu(title: "Date of Birth", value: "20 july 1993", onPressed: (){}),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            

            ///Logout
            Center(  
              child: TextButton(
                onPressed: (){}, 
                child: const Text("Delete Account", style: TextStyle(color: Colors.red))
              ),
            )
          ]
        ),
      ),
    );
  }
}



