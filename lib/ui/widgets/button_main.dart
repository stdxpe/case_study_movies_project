import 'package:flutter/material.dart';

import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class ButtonMain extends StatelessWidget {
  const ButtonMain({
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.height,
    this.padding,
    this.textStyle,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(horizontal: AppConstants.paddings.screen),
      child: SizedBox(
        height: height ?? AppConstants.sizes.buttonHeight,
        width: context.mediaQuery.size.width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor:
                foregroundColor ?? context.colorPalette.buttonMainForeground,
            backgroundColor:
                backgroundColor ?? context.colorPalette.buttonMainBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radius.main),
            ),
          ),
          child: TextCustom(
            text: text,
            textStyle: textStyle ?? context.textTheme.action,
            color: foregroundColor ?? context.colorPalette.buttonMainForeground,
          ),
        ),
      ),
    );
  }
}
