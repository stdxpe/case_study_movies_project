import 'package:flutter/material.dart';

import 'package:case_study_movies_project/services/dummy_data.dart';
import 'package:case_study_movies_project/ui/widgets/card_profile.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class AppbarSliverProfile extends StatelessWidget {
  const AppbarSliverProfile({super.key, required this.innerBoxIsScrolled});

  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shadowColor: context.colorPalette.scaffoldBackground,
      surfaceTintColor: context.colorPalette.scaffoldBackground,
      foregroundColor: context.colorPalette.scaffoldBackground,
      pinned: false,
      floating: true,
      snap: true,
      backgroundColor: context.colorPalette.scaffoldBackground,
      expandedHeight: AppConstants.sizes.profilePicHeight,

      /// TODO: Get UserModel dynamic
      title: CardProfile(userModel: dummyUser),
      centerTitle: false,
      titleSpacing: 0,
      toolbarHeight: 85,
      forceElevated: innerBoxIsScrolled,
    );
  }
}
