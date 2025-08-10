import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class LottieLoadingAnimation extends StatelessWidget {
  const LottieLoadingAnimation({super.key, this.size = 100, this.lottie});
  final double? size;
  final String? lottie;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: Lottie.asset(
          lottie ?? AppVisuals.lottieLoading,
          width: size,
          height: size,
          animate: true,
          fit: BoxFit.contain,
        ),
      ).animate().fadeIn(duration: 150.ms),
    );
  }
}
