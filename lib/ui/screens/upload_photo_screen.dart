import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:case_study_movies_project/ui/widgets/appbar_custom.dart';
import 'package:case_study_movies_project/ui/widgets/button_lite.dart';
import 'package:case_study_movies_project/ui/widgets/button_main.dart';
import 'package:case_study_movies_project/ui/widgets/section_title_subtitle.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class UploadPhotosScreen extends StatelessWidget {
  const UploadPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        onBackPressed: () => context.pop(),
        titleText: AppStrings.profileDetails,
      ),
      backgroundColor: context.theme.colorPalette.scaffoldBackground,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(bottom: AppConstants.paddings.size26),
        child: Column(
          children: [
            SizedBox(height: AppConstants.spacings.space37),
            const SectionTitleSubtitle(
              title: AppStrings.uploadPhotosTitle,
              subtitle: AppStrings.uploadPhotosSubtitle,
            ),
            SizedBox(height: AppConstants.spacings.space47),
            ButtonLite(
              iconPath: AppVisuals.plus,
              iconSize: AppConstants.sizes.iconPlusHeight,
              size: AppConstants.sizes.plusButtonHeight,
              onPressed: () {},
            ),
            const Spacer(),
            ButtonMain(
              text: AppStrings.continueButton,
              onPressed: () {
                context.push(Routes.uploadPhotos);
              },
            ),
          ],
        ),
      ),
    );
  }
}
