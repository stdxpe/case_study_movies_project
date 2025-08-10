import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class SectionTitleSubtitle extends StatelessWidget {
  const SectionTitleSubtitle(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextCustom(
          text: title,
          color: context.theme.colorPalette.text,
          textStyle: context.textTheme.title,
        ).animate().fadeIn(delay: 350.ms, duration: 400.ms),
        SizedBox(height: AppConstants.spacings.space16),
        TextCustom(
          text: subtitle,
          color: context.theme.colorPalette.text,
          textStyle: context.textTheme.subtitle,
          maxLines: 2,
          fontHeightCustom: 1.25,
        ).animate().fadeIn(delay: 400.ms, duration: 450.ms),
      ],
    );
  }
}
