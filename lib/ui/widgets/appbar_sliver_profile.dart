import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/ui/bloc/user_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/user_state.dart';
import 'package:case_study_movies_project/ui/widgets/card_profile.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class AppbarSliverProfile extends StatelessWidget {
  const AppbarSliverProfile({super.key, required this.innerBoxIsScrolled});

  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) => SliverAppBar(
        shadowColor: context.colorPalette.scaffoldBackground,
        surfaceTintColor: context.colorPalette.scaffoldBackground,
        foregroundColor: context.colorPalette.scaffoldBackground,
        pinned: false,
        floating: true,
        snap: true,
        backgroundColor: context.colorPalette.scaffoldBackground,
        expandedHeight: AppConstants.sizes.profilePicHeight,
        title: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.user != null) {
              return CardProfile(userModel: state.user!);
            }
            return const SizedBox.shrink();
          },
        ),
        centerTitle: false,
        titleSpacing: 0,
        toolbarHeight: 85,
        forceElevated: innerBoxIsScrolled,
      );
}
