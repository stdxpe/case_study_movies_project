import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:case_study_movies_project/ui/bloc/user_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/user_event.dart';
import 'package:case_study_movies_project/ui/bloc/user_state.dart';
import 'package:case_study_movies_project/ui/widgets/appbar_custom.dart';
import 'package:case_study_movies_project/ui/widgets/button_lite.dart';
import 'package:case_study_movies_project/ui/widgets/button_main.dart';
import 'package:case_study_movies_project/ui/widgets/section_title_subtitle.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class UploadPhotosScreen extends StatelessWidget {
  const UploadPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        onBackPressed: () => context.go(Routes.profile),
        titleText: AppStrings.profileDetails,
      ),
      backgroundColor: context.theme.colorPalette.scaffoldBackground,
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppConstants.paddings.size26),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: AppConstants.spacings.space37),
                  SectionTitleSubtitle(
                    title: AppStrings.uploadPhotosTitle,
                    subtitle: AppStrings.uploadPhotosSubtitle,
                  ),
                  SizedBox(height: AppConstants.spacings.space47),
                  ButtonLite(
                    loading: state.isLoading,
                    iconPath: AppVisuals.plus,
                    iconSize: AppConstants.sizes.iconPlusHeight,
                    size: AppConstants.sizes.plusButtonHeight,
                    onPressed: () {
                      context.read<UserBloc>().add(UploadUserPhotoEvent());
                    },
                  ).animate().fadeIn(delay: 600.ms, duration: 300.ms),
                  SizedBox(height: AppConstants.spacings.space37),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.paddings.screen),
                    child: TextCustom(
                      text: state.errorMessage ?? '',
                      color: context.theme.colorPalette.error,
                      textStyle: context.textTheme.infoBold,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ).animate().fadeIn(delay: 750.ms, duration: 300.ms),
                  ),
                  SizedBox(height: AppConstants.spacings.space37),
                  if (state.selectedPhotoPath != null)
                    Container(
                      width: AppConstants.sizes.profilePicHeight * 2,
                      height: AppConstants.sizes.profilePicHeight * 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(File(state.selectedPhotoPath!)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ).animate().fadeIn(duration: 500.ms),
                  const Spacer(),
                  ButtonMain(
                    text: AppStrings.continueButton,
                    onPressed: () async {
                      state.selectedPhotoPath != null
                          ? context.pop()
                          : context
                              .read<UserBloc>()
                              .add(ShowPhotoWarningMessageEvent());
                    },
                  ).animate().fadeIn(delay: 1000.ms, duration: 500.ms),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
