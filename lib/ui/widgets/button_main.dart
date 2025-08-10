import 'package:flutter/material.dart';

import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    this.loading = false,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final double? height;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(horizontal: AppConstants.paddings.screen),
      child: SizedBox(
        height: height ?? AppConstants.sizes.buttonHeight,
        width: context.mediaQuery.size.width,
        child: ElevatedButton(
          onPressed: loading! ? null : onPressed,
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(
              foregroundColor ?? context.colorPalette.buttonMainForeground,
            ),
            backgroundColor: WidgetStateProperty.all(
              backgroundColor ?? context.colorPalette.buttonMainBackground,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radius.main),
              ),
            ),
          ),
          child: loading!
              ? const SpinKitRing(
                  color: ColorPalette.permaWhite, size: 20, lineWidth: 3)
              : TextCustom(
                  text: text,
                  textStyle: textStyle ?? context.textTheme.action,
                  color: foregroundColor ??
                      context.colorPalette.buttonMainForeground,
                ),
        ),
      ),
    );
  }
}
