import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class ButtonLite extends StatelessWidget {
  const ButtonLite({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.iconSize,
    this.size,
    this.radius,
    this.backgroundColor,
    this.foregroundColor,
    this.borderEnabled = true,
  });

  final VoidCallback onPressed;
  final String iconPath;
  final double iconSize;
  final double? size;
  final double? radius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool borderEnabled;

  @override
  Widget build(BuildContext context) {
    double size = this.size ?? AppConstants.sizes.socialButtonHeight;

    return SizedBox(
      width: size,
      height: size,
      child: Align(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            fixedSize: Size(size, size),
            foregroundColor:
                foregroundColor ?? context.colorPalette.buttonLiteForeground,
            backgroundColor:
                backgroundColor ?? context.colorPalette.buttonLiteBackground,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(radius ?? AppConstants.radius.main),
            ),
            side: BorderSide(
              width: AppConstants.sizes.borderWidth,
              color: borderEnabled
                  ? context.colorPalette.buttonLiteBorder
                  : Colors.transparent,
            ),
          ),
          child: Center(
            child: SizedBox(
              height: iconSize,
              width: iconSize,
              child: SvgPicture.asset(
                iconPath,
                width: iconSize,
                height: iconSize,
                fit: BoxFit.contain,
                alignment: Alignment.center,
                colorFilter: ColorFilter.mode(
                  foregroundColor ?? context.colorPalette.buttonLiteForeground,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
