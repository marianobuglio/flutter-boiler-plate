import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:acomerlapp/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorItem extends StatelessWidget {
  const ProgressIndicatorItem({
    super.key, required this.value, required this.text,
  });
  final double value;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [ 
        Expanded(flex:1 ,child: Text(text,style: Theme.of(context).textTheme.bodyMedium)),
        Expanded(
          flex: 9,
          child: SizedBox(
            width: TDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: TColors.grey,
              valueColor: const AlwaysStoppedAnimation(TColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}