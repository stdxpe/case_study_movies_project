import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/ui/bloc/movie_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/movie_event.dart';
import 'package:case_study_movies_project/ui/bloc/movie_state.dart';
import 'package:case_study_movies_project/ui/widgets/card_movie_swipeable.dart';
import 'package:case_study_movies_project/ui/widgets/lottie_loading_animation.dart';

/// TODO: Refactor
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _previousMovieCount = 0;
  bool _isLoadingNextPage = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      listener: (context, state) {
        if (state.status == MovieStatus.loaded &&
            state.allMovies.length > _previousMovieCount) {
          _previousMovieCount = state.allMovies.length;
          _isLoadingNextPage = false;
        }
      },
      builder: (context, state) {
        final movies = state.allMovies;
        final isLoadingMore = state.status == MovieStatus.loadingMore;

        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                physics: const _SnappyScrollPhysics(),
                itemCount: movies.length + (isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < movies.length) {
                    return CardMovieSwipeable(
                      movie: movies[index],
                    ).animate().fade(duration: 350.ms);
                  } else {
                    return const Center(child: LottieLoadingAnimation());
                  }
                },
                onPageChanged: (index) {
                  final bloc = context.read<MovieBloc>();
                  final lastPage = state.allMovies.length - 1;

                  if (index == lastPage &&
                      state.status != MovieStatus.loadingMore &&
                      state.status != MovieStatus.error &&
                      !_isLoadingNextPage) {
                    _isLoadingNextPage = true;
                    bloc.add(GetMoviesEvent(page: state.currentPage + 1));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class _SnappyScrollPhysics extends ClampingScrollPhysics {
  const _SnappyScrollPhysics({super.parent});

  @override
  ClampingScrollPhysics applyTo(ScrollPhysics? ancestor) =>
      _SnappyScrollPhysics(parent: buildParent(ancestor));

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) =>
      offset * 1.4;
}
