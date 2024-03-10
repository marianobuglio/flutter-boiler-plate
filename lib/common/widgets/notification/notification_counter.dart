import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NotificationCounterIcon extends StatelessWidget {
  const NotificationCounterIcon({
    super.key, required this.iconColor, this.onPressed,
  });
  final Color iconColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: const Icon(Iconsax.notification,
            color: TColors.white)
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: TColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('2', style: Theme.of(context).textTheme.labelSmall!.apply(color: iconColor)),
            ),
          ),
        )
      ]
    );
  }
}