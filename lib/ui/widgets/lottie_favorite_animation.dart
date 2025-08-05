import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FullscreenLottieOverlay extends StatelessWidget {
  final String lottiePath;
  final VoidCallback onAnimationComplete;

  const FullscreenLottieOverlay({
    Key? key,
    required this.lottiePath,
    required this.onAnimationComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Lottie.asset(
          lottiePath,
          width: 200,
          height: 200,
          onLoaded: (composition) {},
          repeat: false,
          // onFinished: onAnimationComplete,
        ),
      ),
    );
  }
}
