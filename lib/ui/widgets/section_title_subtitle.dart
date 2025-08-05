import 'package:flutter/material.dart';

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
        ),
        SizedBox(height: AppConstants.spacings.space8),
        TextCustom(
          text: subtitle,
          color: context.theme.colorPalette.text,
          textStyle: context.textTheme.subtitle,
          maxLines: 2,
        ),
      ],
    );
  }
}
