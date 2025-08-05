import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({
    super.key,
    required this.text,
    required this.color,
    required this.textStyle,
    this.fontSizeCustom,
    this.fontHeightCustom,
    this.fontWeightCustom,
    this.fontLetterSpacingCustom,
    this.maxLines = 1,
    this.textAlignCustom = TextAlign.center,
    this.isLineThrough = false,
    this.overflow,
    this.alignment,
  });

  final String text;
  final Color color;
  final TextStyle textStyle;
  final double? fontSizeCustom;
  final double? fontHeightCustom;
  final FontWeight? fontWeightCustom;
  final double? fontLetterSpacingCustom;
  final TextAlign? textAlignCustom;
  final bool? isLineThrough;
  final int? maxLines;
  final TextOverflow? overflow;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      alignment: alignment,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlignCustom,
        textScaler: TextScaler.noScaling,
        style: textStyle.copyWith(
          decoration: isLineThrough! ? TextDecoration.lineThrough : null,
          color: color,
          fontSize: fontSizeCustom,
          height: fontHeightCustom,
          fontWeight: fontWeightCustom ?? textStyle.fontWeight,
          letterSpacing: fontLetterSpacingCustom ?? textStyle.letterSpacing,
          overflow: overflow,
        ),
      ),
    );
  }
}
