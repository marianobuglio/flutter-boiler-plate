 import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiverWidget extends StatelessWidget {
  const DiverWidget({
    super.key,
    required this.dark,
    required this.text
  });

  final bool dark;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TColors.light : TColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(text.capitalize!, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: dark ? TColors.light : TColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        )
      ],
    );
  }
}