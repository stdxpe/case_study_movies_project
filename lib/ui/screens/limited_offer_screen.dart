import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:case_study_movies_project/ui/widgets/button_main.dart';
import 'package:case_study_movies_project/ui/widgets/section_card_tokens.dart';
import 'package:case_study_movies_project/ui/widgets/section_rewards.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class LimitedOfferScreen extends StatelessWidget {
  const LimitedOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.radius.bottomSheet),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: context.colorPalette.bottomSheetBackground,
              ),
            ),
            const GlowEllipse(
              diameter: 217.39,
              offset: Offset(0, -83.74),
              blurSigma: 108.125,
              opacity: 0.6,
            ),
            const GlowEllipse(
              diameter: 217.39,
              offset: Offset(0.5, 503.12),
              blurSigma: 125,
              opacity: 1.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.paddings.limitedOfferScreenHorizontal,
              ),
              child: Column(
                children: [
                  SizedBox(height: AppConstants.spacings.space24),
                  TextCustom(
                    text: AppStrings.limitedOffer,
                    color: context.theme.colorPalette.text,
                    textStyle: context.textTheme.title,
                    fontSizeCustom: AppConstants.fontSizes.size20,
                  ),
                  SizedBox(height: AppConstants.spacings.space4),
                  TextCustom(
                    text: AppStrings.limitedOfferSubtitle,
                    color: context.theme.colorPalette.text,
                    textStyle: context.textTheme.infoLight,
                    maxLines: 2,
                  ),
                  SizedBox(height: AppConstants.spacings.space13),
                  const SectionRewards(),
                  SizedBox(height: AppConstants.spacings.space20),
                  TextCustom(
                    text: AppStrings.tokenPackTitle,
                    color: context.theme.colorPalette.text,
                    textStyle: context.textTheme.action,
                  ),
                  SizedBox(height: AppConstants.spacings.space20),
                  const Flexible(child: SectionCardTokens()),
                  SizedBox(height: AppConstants.spacings.space20),
                  ButtonMain(
                    text: AppStrings.tokenButton,
                    padding: EdgeInsets.zero,
                    onPressed: () => context.navigator.pop(),
                  ),
                  SizedBox(height: AppConstants.spacings.space24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GlowEllipse extends StatelessWidget {
  const GlowEllipse({
    super.key,
    required this.diameter,
    required this.offset,
    required this.blurSigma,
    this.opacity = 1.0,
  });

  final double diameter;
  final Offset offset;
  final double blurSigma;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (context.mediaQuery.size.width - diameter) / 2 + offset.dx,
      top: offset.dy,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFE50914).withAlpha(128),
          ),
        ),
      ),
    );
  }
}
