import 'package:acomerlapp/common/widgets/appbar/appbar.dart';
import 'package:acomerlapp/common/widgets/notification/notification_counter.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });
   
  @override
  Widget build(BuildContext context) {
    return TAppBar(
        title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.grey)),
          Text(TTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white))
        ]
      ),
      showBackButton: false,
      actions:  [
        NotificationCounterIcon(iconColor: TColors.white, onPressed: (){}),
      ]
    );
  }
}