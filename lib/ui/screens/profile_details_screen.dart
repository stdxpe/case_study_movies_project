import 'package:flutter/material.dart';

import 'package:case_study_movies_project/services/global_services.dart/dummy_data.dart';
import 'package:case_study_movies_project/ui/screens/limited_offer_screen.dart';
import 'package:case_study_movies_project/ui/widgets/appbar_custom.dart';
import 'package:case_study_movies_project/ui/widgets/appbar_sliver_profile.dart';
import 'package:case_study_movies_project/ui/widgets/button_profile.dart';
import 'package:case_study_movies_project/ui/widgets/card_movie.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        onBackPressed: () {},
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
              GridView.builder(
                //TODO: GET DYNAMIC ITEMCOUNT from API
                itemCount: 20,
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
                      movieTitle: dummyMoviesList[(index % 5)].title,
                      movieSubtitle: 'Fox Studios',
                      imagePath: dummyMoviesList[(index % 5)].posterUrl);
                },
              ),
              SizedBox(height: AppConstants.paddings.screen),
            ],
          ),
        ),
      ),
    );
  }
}
