import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/models/movie_model.dart';
import 'package:case_study_movies_project/ui/bloc/lottie_animation_cubit.dart';
import 'package:case_study_movies_project/ui/bloc/movie_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/movie_event.dart';
import 'package:case_study_movies_project/ui/bloc/movie_state.dart';
import 'package:case_study_movies_project/ui/widgets/button_favorite.dart';
import 'package:case_study_movies_project/ui/widgets/card_movie_description.dart';
import 'package:case_study_movies_project/ui/widgets/lottie_like_animation.dart';
import 'package:case_study_movies_project/ui/widgets/lottie_loading_animation.dart';
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
              child: LottieLoadingAnimation(),
              // child: CircularProgressIndicator(
              //   color: Colors.white,
              //   strokeWidth: 2,
              // ),
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
        const LottieLikeAnimation(),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CardMovieDescription(
            title: movie.title,
            description: movie.description,
            iconPath: AppVisuals.logo,
            onPressed: () {},
          ).animate(delay: 475.ms).fade(duration: 350.ms),
        ),
        Positioned(
          right: 000,
          bottom: AppConstants.paddings.favoriteButtonBottom,
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(
                right: AppConstants.paddings.favoriteButtonRight),
            child:
                BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
              if (state.status == MovieStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == MovieStatus.loaded) {
                return ButtonFavorite(
                  isLiked: context.read<MovieBloc>().state.isLiked(movie.id),
                  onPressed: () {
                    final currentIsLiked =
                        context.read<MovieBloc>().state.isLiked(movie.id);
                    context
                        .read<MovieBloc>()
                        .add(ToggleFavoriteMovieEvent(movieId: movie.id));
                    context.read<LottieAnimationCubit>().update(
                          isLiked: !currentIsLiked,
                          showAnimation: true,
                        );
                  },
                );
              } else if (state.status == MovieStatus.error) {
                return Center(child: Text('Error: ${state.errorMessage}'));
              }
              return const SizedBox.shrink();
            }),
          ),
        ),
      ],
    );
  }
}
