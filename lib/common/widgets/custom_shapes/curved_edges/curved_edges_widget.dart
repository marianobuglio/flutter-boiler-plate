import 'package:acomerlapp/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:acomerlapp/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TCurvedWidget extends StatelessWidget {
  const TCurvedWidget({
    super.key, required this.height, required this.child, 
  });
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: Container(
        color:TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: height,
          child: child,
        ),
      ),
    );
  }
}