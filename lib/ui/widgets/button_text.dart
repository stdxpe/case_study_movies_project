import 'package:flutter/material.dart';

import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({
    super.key,
    this.leadingText,
    required this.buttonText,
    required this.onPressed,
    this.customTextStyle,
    this.isUnderlinedButton = false,
    this.padding = EdgeInsets.zero,
    this.spacing,
  });

  final VoidCallback onPressed;
  final String buttonText;
  final String? leadingText;
  final TextStyle? customTextStyle;
  final bool isUnderlinedButton;
  final EdgeInsetsGeometry padding;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final hasLeading = leadingText != null && leadingText!.isNotEmpty;
    final textStyle = customTextStyle ?? context.textTheme.infoLight;
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasLeading)
              TextCustom(
                text: leadingText!,
                textStyle: textStyle,
                color: context.colorPalette.textFaded05,
              ),
            if (hasLeading)
              SizedBox(width: spacing ?? AppConstants.spacings.space8),
            TextCustom(
              text: buttonText,
              textStyle: textStyle.copyWith(
                decoration: isUnderlinedButton
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
              color: context.colorPalette.text,
            ),
          ],
        ),
      ),
    );
  }
}
