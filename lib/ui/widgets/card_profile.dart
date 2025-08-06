import 'package:flutter/material.dart';

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
                image: NetworkImage(userModel.photoUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                ),
                SizedBox(height: AppConstants.spacings.space8),
                TextCustom(
                  text: "ID: ${userModel.id}",
                  color: context.colorPalette.textFaded05,
                  textStyle: context.textTheme.infoLight,
                  overflow: TextOverflow.ellipsis,
                ),
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
