import 'package:flutter/material.dart';

import 'package:case_study_movies_project/ui/widgets/button_lite.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class SectionSocialLogin extends StatelessWidget {
  const SectionSocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonLite(
          iconPath: AppVisuals.google,
          iconSize: AppConstants.sizes.iconGoogleHeight,
          onPressed: () {},
        ),
        SizedBox(width: AppConstants.spacings.space8),
        ButtonLite(
          iconPath: AppVisuals.apple,
          iconSize: AppConstants.sizes.iconAppleHeight,
          onPressed: () {},
        ),
        SizedBox(width: AppConstants.spacings.space8),
        ButtonLite(
          iconPath: AppVisuals.facebook,
          iconSize: AppConstants.sizes.iconFacebookHeight,
          onPressed: () {},
        ),
      ],
    );
  }
}
