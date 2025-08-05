import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    super.key,
    required this.prefixIconPath,
    required this.prefixIconSize,
    this.suffixIconPath,
    this.suffixIconSize,
    this.hintText,
  });

  final String prefixIconPath;
  final double prefixIconSize;
  final String? suffixIconPath;
  final double? suffixIconSize;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.sizes.textFieldHeight,
      margin: EdgeInsets.symmetric(
        horizontal: AppConstants.paddings.screen,
      ),
      alignment: Alignment.center,
      child: TextFormField(
        style: context.textTheme.infoLight.copyWith(
          color: context.colorPalette.textFieldForeground,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: context.colorPalette.textFieldForeground,
        textAlignVertical: TextAlignVertical.center,
        expands: true,
        minLines: null,
        maxLines: null,
        decoration: InputDecoration(
          filled: true,
          fillColor: context.colorPalette.textFieldBackground,
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
          hintStyle: context.textTheme.infoLight.copyWith(
            color: context.colorPalette.textFieldForegroundFaded,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radius.main),
            borderSide: BorderSide(
              color: context.colorPalette.textFieldBorder,
              width: AppConstants.sizes.borderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radius.main),
            borderSide: BorderSide(
              color: context.colorPalette.textFieldBorder,
              width: AppConstants.sizes.borderWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radius.main),
            borderSide: BorderSide(
              color: context.colorPalette.textFieldForeground,
              width: AppConstants.sizes.borderWidth,
            ),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: AppConstants.paddings.textFieldBorderToPrefixW,
              right: AppConstants.paddings.textFieldTextHorizontal,
            ),
            child: SvgPicture.asset(
              prefixIconPath,
              width: prefixIconSize,
              height: prefixIconSize,
              colorFilter: ColorFilter.mode(
                context.colorPalette.textFieldForeground,
                BlendMode.srcIn,
              ),
            ),
          ),
          suffixIcon: suffixIconPath != null && suffixIconSize != null
              ? Padding(
                  padding: EdgeInsets.only(
                    right: AppConstants.paddings.textFieldSuffixtoBorderW,
                    left: AppConstants.paddings.textFieldTextHorizontal,
                  ),
                  child: SvgPicture.asset(
                    suffixIconPath!,
                    width: suffixIconSize!,
                    height: suffixIconSize!,
                    colorFilter: ColorFilter.mode(
                      context.colorPalette.textFieldForeground,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : null,
          prefixIconConstraints: BoxConstraints(
            minWidth: prefixIconSize,
            minHeight: prefixIconSize,
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: suffixIconSize ?? 0,
            minHeight: suffixIconSize ?? 0,
          ),
        ),
      ),
    );
  }
}
