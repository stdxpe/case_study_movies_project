import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/ui/bloc/movie_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/movie_state.dart';
import 'package:case_study_movies_project/ui/screens/limited_offer_screen.dart';
import 'package:case_study_movies_project/ui/widgets/appbar_custom.dart';
import 'package:case_study_movies_project/ui/bloc/navigation_bar_cubit.dart';
import 'package:case_study_movies_project/ui/widgets/appbar_sliver_profile.dart';
import 'package:case_study_movies_project/ui/widgets/button_profile.dart';
import 'package:case_study_movies_project/ui/widgets/card_movie.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';
import 'package:case_study_movies_project/services/global_services.dart/dependency_injection_service.dart';

//  BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
//               return switch (state.status) {
//                 MovieStatus.loading => const Center(
//                     child: CircularProgressIndicator(color: Colors.white)),
//                 MovieStatus.loaded => PageView.builder(
//                     controller: _pageController,
//                     scrollDirection: Axis.vertical,
//                     physics: const _SnappyScrollPhysics(),
//                     itemCount: state.allMovies.length,
//                     itemBuilder: (context, index) =>
//                         CardMovieSwipeable(movie: state.allMovies[index])),
//                 MovieStatus.error =>
//                   Center(child: Text('Error: ${state.errorMessage}')),
//                 _ => const SizedBox.shrink(),
//               };
//             }),

// SpinKitCubeGrid(color: ColorPalette.permaWhite,size: 40),

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        onBackPressed: () => locator<NavigationBarCubit>().goTab(0),
        titleText: AppStrings.profileDetails,
        rightWidget: ButtonProfile(
          text: AppStrings.limitedOffer,
          iconPath: AppVisuals.gem,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              enableDrag: true,
              showDragHandle: false,
              isScrollControlled: true,
              backgroundColor: context.colorPalette.bottomSheetBackground,
              barrierColor: Colors.black.withAlpha(191),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppConstants.radius.bottomSheet))),
              builder: (context) => const FractionallySizedBox(
                heightFactor: 0.77,
                widthFactor: 1,
                child: LimitedOfferScreen(),
              ),
            );
          },
        ),
      ),
      backgroundColor: context.theme.colorPalette.scaffoldBackground,
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [AppbarSliverProfile(innerBoxIsScrolled: innerBoxIsScrolled)],
        body: SingleChildScrollView(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.paddings.size17),
          child: Column(
            children: [
              SizedBox(height: AppConstants.spacings.space30),
              TextCustom(
                text: AppStrings.favoriteMovies,
                color: context.colorPalette.text,
                textStyle: context.textTheme.infoBold,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: AppConstants.spacings.space24),
              BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
                if (state.status == MovieStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == MovieStatus.loaded) {
                  final movies = state.favoriteMovies;

                  return GridView.builder(
                    itemCount: movies.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppConstants.spacings.space16,
                      crossAxisSpacing: AppConstants.spacings.space16,
                      mainAxisExtent: context.movieCardTotalHeight,
                    ),
                    itemBuilder: (context, index) {
                      return CardMovie(
                          movieTitle: movies[index].title,
                          movieSubtitle: 'Fox Studios',
                          imagePath: movies[index].posterUrl);
                    },
                  );
                } else if (state.status == MovieStatus.error) {
                  /// TODO: SNACKBAR
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }
                return const SizedBox.shrink();
              }),
              SizedBox(height: AppConstants.paddings.screen),
            ],
          ),
        ),
      ),
    );
  }
}
