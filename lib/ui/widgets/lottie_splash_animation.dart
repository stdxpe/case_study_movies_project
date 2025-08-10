import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class LottieSplashAnimation extends StatelessWidget {
  const LottieSplashAnimation({super.key, this.size = 200});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Lottie.asset(
        context.theme.brightness == Brightness.dark
            ? AppVisuals.lottieCamera
            : AppVisuals.lottieCameraDark,
        width: size,
        height: size,
        animate: true,
        fit: BoxFit.contain,
      ),
    );
  }
}
