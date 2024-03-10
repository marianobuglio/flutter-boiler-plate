import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key, required this.title,   this.buttonTitle = 'View all', this.onPressed, required this.showActionButton, this.color,
  });
  final String title;
  final String buttonTitle;
  final bool showActionButton;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
        Text(title, style: Theme.of(context).textTheme.headlineSmall!.apply(color: color), maxLines: 1, overflow: TextOverflow.ellipsis),
       if (showActionButton) 
        TextButton(onPressed: onPressed, child:  Text(buttonTitle, style: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.black))) 
      ] 
    );
  }
}