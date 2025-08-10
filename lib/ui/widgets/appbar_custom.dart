import 'package:flutter/material.dart';

import 'package:case_study_movies_project/ui/widgets/button_lite.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final VoidCallback onBackPressed;
  final Widget? rightWidget;

  const AppBarCustom({
    super.key,
    required this.titleText,
    required this.onBackPressed,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        padding: EdgeInsets.symmetric(horizontal: AppConstants.paddings.size17),
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: TextCustom(
                text: titleText,
                color: context.theme.colorPalette.text,
                textStyle: context.textTheme.action,
              ),
            ),
            Positioned(
              left: 0,
              child: ButtonLite(
                iconPath: AppVisuals.leftArrow,
                iconSize: AppConstants.sizes.iconLeftArrowHeight,
                size: AppConstants.sizes.backButtonHeight,
                radius: AppConstants.radius.circular,
                onPressed: onBackPressed,
              ),
            ),
            if (rightWidget != null)
              Positioned(
                right: 0,
                child: rightWidget!,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppConstants.sizes.appBarHeight);
}
