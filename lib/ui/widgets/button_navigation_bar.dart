import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class ButtonNavigationBarItem extends StatelessWidget {
  const ButtonNavigationBarItem({
    super.key,
    required this.onPressed,
    required this.text,
    required this.iconPath,
  });

  final VoidCallback onPressed;
  final String text;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: AppConstants.paddings.navButtonVertical,
          horizontal: AppConstants.paddings.navButtonHorizontal,
        ),
        backgroundColor: context.colorPalette.scaffoldBackground,
        foregroundColor: context.colorPalette.navigationBar,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppConstants.radius.navBarItem,
          ),
        ),
        side: BorderSide(
          width: AppConstants.sizes.borderWidth,
          color: context.colorPalette.buttonLiteBorder,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: AppConstants.sizes.navBarItemHeight,
            height: AppConstants.sizes.navBarItemHeight,
            fit: BoxFit.contain,
            alignment: Alignment.center,
            colorFilter: ColorFilter.mode(
              context.colorPalette.navigationBar,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: AppConstants.spacings.space8),
          TextCustom(
            text: text,
            color: context.colorPalette.navigationBar,
            textStyle: context.textTheme.infoLight,
            fontWeightCustom: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
