
import 'package:acomerlapp/common/widgets/images/circular_images.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key, 
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
    leading: const CircularImage(image: TImages.user, height: 50, width: 50,padding: 0,),
    title: Text('User Name', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
    subtitle: Text('marianobuglio@gmail.com', style: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.white)),
    trailing:  IconButton(icon:const Icon(Iconsax.edit), color: TColors.white, onPressed: onPressed),
                    );
  }
}