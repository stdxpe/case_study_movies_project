import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class ButtonFavorite extends StatelessWidget {
  const ButtonFavorite({
    super.key,
    required this.onPressed,
    required this.isLiked,
  });

  final VoidCallback onPressed;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.radius.circular),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(
              vertical: AppConstants.paddings.favoriteButtonVertical,
              horizontal: AppConstants.paddings.favoriteButtonHorizontal,
            ),
            backgroundColor:
                context.colorPalette.scaffoldBackground.withOpacity(0.2),
            foregroundColor: context.colorPalette.text,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppConstants.radius.circular,
              ),
            ),
            side: BorderSide(
              width: AppConstants.sizes.borderWidth,
              color: context.colorPalette.buttonLiteBorder,
            ),
          ),
          child: SvgPicture.asset(
            AppVisuals.like,
            width: AppConstants.sizes.iconFavoriteHeight,
            height: AppConstants.sizes.iconFavoriteHeight,
            fit: BoxFit.contain,
            alignment: Alignment.center,
            colorFilter: ColorFilter.mode(
              isLiked ? ColorPalette.permaRed : ColorPalette.permaWhite,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
