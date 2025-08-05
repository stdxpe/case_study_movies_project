import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class CardMovieDescription extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;
  final VoidCallback onPressed;

  const CardMovieDescription({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.paddings.cardMovieDesc),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppConstants.sizes.iconLogoHeight,
            width: AppConstants.sizes.iconLogoHeight,
            child: SvgPicture.asset(
              AppVisuals.logo,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(width: AppConstants.spacings.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  text: title,
                  color: context.theme.colorPalette.text,
                  textStyle: context.textTheme.title,
                ),
                SizedBox(height: AppConstants.spacings.space4),
                ReadMoreText(
                  description,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  delimiter: AppStrings.textEllipsisDots,
                  trimCollapsedText: AppStrings.seeMore,
                  trimExpandedText: AppStrings.hide,
                  postDataTextStyle:
                      TextStyle(color: context.colorPalette.textFaded075),
                  moreStyle: context.textTheme.infoBold
                      .copyWith(color: context.colorPalette.text),
                  lessStyle: context.textTheme.infoBold
                      .copyWith(color: context.colorPalette.text),
                  colorClickableText: context.colorPalette.text,
                  style: TextStyle(
                    color: context.colorPalette.textFaded075,
                    height: 1.2,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
