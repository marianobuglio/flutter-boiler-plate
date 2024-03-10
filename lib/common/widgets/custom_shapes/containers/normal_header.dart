import 'package:acomerlapp/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TNormalHeader extends StatelessWidget {
  const TNormalHeader({
    super.key, required this.child, this.height = 400,
  });
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const  EdgeInsets.all(TSizes.defaultSpace),
      child: Stack(
        children: [
          child,
        ],
      ),
    );
  }
}