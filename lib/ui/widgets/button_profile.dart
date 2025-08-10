import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class ButtonProfile extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String? iconPath;
  final double? radius;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const ButtonProfile({
    super.key,
    required this.onPressed,
    required this.text,
    this.iconPath,
    this.radius,
    this.paddingVertical,
    this.paddingHorizontal,
    this.fontSize,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? context.colorPalette.buttonMainBackground,
        foregroundColor:
            foregroundColor ?? context.colorPalette.buttonMainForeground,
        padding: EdgeInsets.symmetric(
          horizontal:
              paddingHorizontal ?? AppConstants.paddings.limitedOfferHorizontal,
          vertical:
              paddingVertical ?? AppConstants.paddings.limitedOfferVertical,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              radius ?? AppConstants.radius.limitedOfferButton),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (iconPath != null) ...[
            SvgPicture.asset(
              iconPath!,
              width: AppConstants.sizes.iconGemHeight,
              height: AppConstants.sizes.iconGemHeight,
              alignment: Alignment.centerRight,
              colorFilter: ColorFilter.mode(
                foregroundColor ?? context.colorPalette.buttonMainForeground,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: AppConstants.spacings.space4),
          ],
          TextCustom(
            text: text,
            color: foregroundColor ?? context.colorPalette.buttonMainForeground,
            textStyle: context.textTheme.infoLight,
            fontSizeCustom: fontSize,
            fontWeightCustom: FontWeight.w600,
            alignment: Alignment.centerRight,
            textAlignCustom: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
