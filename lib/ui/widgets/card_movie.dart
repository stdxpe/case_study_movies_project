import 'package:case_study_movies_project/models/movie_model.dart';
import 'package:flutter/material.dart';

import 'package:case_study_movies_project/ui/widgets/lottie_loading_animation.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.radius.movieCard),
          child: AspectRatio(
            aspectRatio: AppConstants.sizes.movieCardAspectRatio,
            child: Image.network(
              movie.posterUrl,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              height: AppConstants.sizes.movieCardHeight,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: LottieLoadingAnimation(size: 50));
              },
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
              ),
            ),
          ),
        ),
        SizedBox(height: AppConstants.spacings.space16),
        TextCustom(
          text: movie.title,
          textStyle: context.textTheme.infoLight,
          fontWeightCustom: FontWeight.w500,
          alignment: Alignment.centerLeft,
          color: context.colorPalette.text,
        ),
        TextCustom(
          text: movie.description,
          textStyle: context.textTheme.infoLight,
          alignment: Alignment.centerLeft,
          color: context.colorPalette.textFaded05,
        ),
      ],
    );
  }
}
