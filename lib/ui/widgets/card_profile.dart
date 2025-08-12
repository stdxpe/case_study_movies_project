import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:case_study_movies_project/ui/bloc/user_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/user_event.dart';
import 'package:case_study_movies_project/models/user_model.dart';
import 'package:case_study_movies_project/ui/widgets/button_profile.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.paddings.size17),
      decoration: BoxDecoration(
        color: context.colorPalette.scaffoldBackground,
        borderRadius: BorderRadius.circular(AppConstants.radius.circular),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppConstants.sizes.profilePicHeight,
            height: AppConstants.sizes.profilePicHeight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image:
                    (userModel.photoUrl == null || userModel.photoUrl!.isEmpty)
                        ? const AssetImage(AppVisuals.dummyProfilePic)
                        : NetworkImage(userModel.photoUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ).animate().fadeIn(delay: 100.ms, duration: 300.ms),
          SizedBox(width: AppConstants.spacings.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  text: userModel.name,
                  color: context.colorPalette.text,
                  textStyle: context.textTheme.action,
                  overflow: TextOverflow.ellipsis,
                ).animate().fadeIn(delay: 300.ms, duration: 300.ms),
                SizedBox(height: AppConstants.spacings.space8),
                TextCustom(
                  text: "ID: ${userModel.id.substring(0, 7)}",
                  color: context.colorPalette.textFaded05,
                  textStyle: context.textTheme.infoLight,
                  overflow: TextOverflow.ellipsis,
                ).animate().fadeIn(delay: 500.ms, duration: 300.ms),
              ],
            ),
          ),
          SizedBox(width: AppConstants.spacings.space12),
          ButtonProfile(
            text: AppStrings.addPhotoButton,
            radius: AppConstants.radius.addPhotoButton,
            fontSize: AppConstants.fontSizes.size13,
            paddingHorizontal: AppConstants.paddings.addPhotoHorizontal,
            paddingVertical: AppConstants.paddings.addPhotoVertical,
            onPressed: () {
              context.read<UserBloc>().add(ResetUserPhotoStateEvent());
              context.push(Routes.uploadPhotos);
            },
          ).animate().fadeIn(delay: 600.ms, duration: 300.ms),
        ],
      ),
    );
  }
}
