import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RaitingBarIndicator extends StatelessWidget {
  const RaitingBarIndicator({
    super.key, required this.value,
  });

  final double value;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: value,
      itemCount: 5,
      itemSize: 20,
      itemBuilder: (_,__) => const Icon(Icons.star, color: TColors.primary)
      
    );
  }
}