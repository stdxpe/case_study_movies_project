import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:case_study_movies_project/ui/widgets/card_reward.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class SectionRewards extends StatelessWidget {
  const SectionRewards({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.radius.bottomSheetGlass),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: context.mediaQuery.size.width,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppConstants.radius.bottomSheetGlass),
            border: Border.all(
                color: ColorPalette.permaWhite.withAlpha(26), width: 1.5),
            gradient: AppGradients.blurredWhiteGlassBackground(),
          ),
          padding: EdgeInsets.only(
            top: AppConstants.paddings.rewardCardTop,
            left: AppConstants.paddings.rewardCardHorizontal,
            right: AppConstants.paddings.rewardCardHorizontal,
            bottom: AppConstants.paddings.rewardCardVertical,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextCustom(
                text: AppStrings.bonus,
                color: context.theme.colorPalette.text,
                textStyle: context.textTheme.action,
              ),
              SizedBox(height: AppConstants.spacings.space16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardReward(
                    iconPath: AppVisuals.diamond,
                    text: AppStrings.premium,
                  ),
                  CardReward(
                    iconPath: AppVisuals.twoHeart,
                    text: AppStrings.moreMatches,
                  ),
                  CardReward(
                    iconPath: AppVisuals.upArrow,
                    text: AppStrings.boostProfile,
                  ),
                  CardReward(
                    iconPath: AppVisuals.heart,
                    text: AppStrings.moreLikes,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
