import 'package:flutter/material.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset;
import 'package:case_study_movies_project/models/token_model.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class CardToken extends StatelessWidget {
  const CardToken({super.key, required this.gradient, required this.token});

  final TokenModel token;
  final RadialGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: inset.BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radius.tokenCard),
        gradient: gradient,
        border: Border.all(
          color: ColorPalette.permaWhite.withAlpha(102),
          width: 1,
        ),
        boxShadow: const [
          inset.BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.3),
            offset: Offset(4, 4),
            blurRadius: 15,
            inset: true,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -25,
            // top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    token.assetPath,
                    width: 60,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  TextCustom(
                    text: '+${token.discountPercent.toStringAsFixed(0)}%',
                    color: ColorPalette.permaWhite,
                    textStyle: context.textTheme.infoLight,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextCustom(
                    text: token.formerTokenCount,
                    color: ColorPalette.permaWhite,
                    textStyle: context.textTheme.action,
                    isLineThrough: true,
                  ),
                  SizedBox(height: AppConstants.spacings.space2),
                  TextCustom(
                    text: token.tokenCount,
                    color: ColorPalette.permaWhite,
                    textStyle: context.textTheme.tokenMontserrat,
                  ),
                  SizedBox(height: AppConstants.spacings.space2),
                  TextCustom(
                    text: AppStrings.token,
                    color: ColorPalette.permaWhite,
                    textStyle: context.textTheme.action,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextCustom(
                  text: '${token.currency}${token.price}',
                  color: ColorPalette.permaWhite,
                  textStyle: context.textTheme.tokenMontserrat,
                  fontSizeCustom: 15,
                ),
                SizedBox(height: AppConstants.spacings.space4),
                TextCustom(
                  text: AppStrings.perWeek,
                  color: ColorPalette.permaWhite,
                  textStyle: context.textTheme.infoLight,
                  fontSizeCustom: 11,
                  fontHeightCustom: 1,
                ),
                SizedBox(height: AppConstants.spacings.space6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
