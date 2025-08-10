import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:case_study_movies_project/ui/widgets/button_main.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

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
              child:
                  Container(color: context.colorPalette.bottomSheetBackground),
            ),
            const GlowEllipse(
              diameter: 217.39,
              offset: Offset(0, -83.74),
              blurSigma: 108.125,
              opacity: 150,
            ),
            const GlowEllipse(
              diameter: 217.39,
              offset: Offset(0.5, 503.12),
              blurSigma: 125,
              opacity: 150,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.paddings.size20,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: AppConstants.spacings.space24,
                        bottom: AppConstants.spacings.space32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextCustom(
                            text: AppStrings.termsAndConditionsTitle,
                            color: context.theme.colorPalette.text,
                            textStyle: context.textTheme.title,
                            fontSizeCustom: 17,
                          ),
                          SizedBox(height: AppConstants.spacings.space20),
                          TextCustom(
                            text: AppStrings.termsAndConditionsMainText,
                            color: context.theme.colorPalette.text,
                            textStyle: context.textTheme.subtitle,
                            fontHeightCustom: 1.25,
                            fontSizeCustom: 13,
                            maxLines: 50,
                            textAlignCustom: TextAlign.start,
                          ),
                          SizedBox(height: AppConstants.spacings.space20),
                          TextCustom(
                            text: AppStrings.termsAndConditionsClosingText,
                            color: context.theme.colorPalette.text,
                            textStyle: context.textTheme.subtitle,
                            fontSizeCustom: 13,
                            fontHeightCustom: 1.25,
                            textAlignCustom: TextAlign.start,
                            maxLines: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ButtonMain(
                    text: AppStrings.termsAndConditionsButton,
                    padding: EdgeInsets.zero,
                    onPressed: () => context.pop(),
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
    this.opacity = 255,
  });

  final double diameter;
  final Offset offset;
  final double blurSigma;
  final int opacity;

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
            color: const Color(0xFFE50914).withAlpha(opacity),
          ),
        ),
      ),
    );
  }
}
