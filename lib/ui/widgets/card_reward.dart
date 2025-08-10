import 'package:flutter/material.dart';

import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class CardReward extends StatelessWidget {
  final String iconPath;
  final String text;

  const CardReward({super.key, required this.iconPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: AppConstants.sizes.rewardCardHeight,
          height: AppConstants.sizes.rewardCardHeight,
          alignment: Alignment.center,
          child: Image.asset(iconPath, fit: BoxFit.contain),
        ),
        SizedBox(height: AppConstants.spacings.space13),
        TextCustom(
          text: text,
          color: context.colorPalette.text,
          textStyle: context.textTheme.infoLight,
          textAlignCustom: TextAlign.center,
          maxLines: 2,
        ),
      ],
    );
  }
}
