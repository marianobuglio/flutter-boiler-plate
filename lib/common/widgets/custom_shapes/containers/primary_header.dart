import 'package:acomerlapp/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:acomerlapp/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TPrimaryHeader extends StatelessWidget {
  const TPrimaryHeader({
    super.key, required this.child, this.height = 400,
  });
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return TCurvedWidget(
        height: height,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                  backgroundColor: TColors.white.withOpacity(0.1),
                  margin: EdgeInsets.zero,
                  ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                  backgroundColor: TColors.white.withOpacity(0.1), margin: EdgeInsets.zero,),
            ),
            child,
          ],
        )
      );
  }
}