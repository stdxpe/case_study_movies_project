import 'package:flutter/material.dart';

import 'package:case_study_movies_project/models/movie_model.dart';
import 'package:case_study_movies_project/ui/widgets/button_favorite.dart';
import 'package:case_study_movies_project/ui/widgets/card_movie_description.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class CardMovieSwipeable extends StatelessWidget {
  const CardMovieSwipeable({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          movie.posterUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            );
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: AppConstants.sizes.gradientHeight,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  ColorPalette.permaBlack,
                  ColorPalette.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: AppConstants.paddings.favoriteButtonBottom,
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(
                right: AppConstants.paddings.favoriteButtonRight),
            child: ButtonFavorite(isLiked: false, onPressed: () {}),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CardMovieDescription(
            title: movie.title,
            description: movie.description,
            iconPath: AppVisuals.logo,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
