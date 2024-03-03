import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    // to build the animation only
    return AnimatedBuilder(
        animation: slidingAnimation,
        // _ to full the place
        builder: (context,_) {
          return SlideTransition(
            position: slidingAnimation,
            child: Image.asset("assets/images/logo_for_photo.png"),
          );
        }
    );
  }
}
