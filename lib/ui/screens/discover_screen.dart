import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/services/global_services.dart/dummy_data.dart';
import 'package:case_study_movies_project/ui/bloc/movie_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/movie_state.dart';
import 'package:case_study_movies_project/ui/widgets/card_movie_swipeable.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final PageController _pageController = PageController();
  bool _isLoadingMore = false;
  List moviesData = [...dummyMoviesList];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadMoreMovies() async {
    if (_isLoadingMore) return;
    setState(() => _isLoadingMore = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      moviesData.addAll(newDummyMovie);
      _isLoadingMore = false;
    });

    if (mounted) {
      final nextPage = _pageController.page!.round() + 1;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is OverscrollNotification) {
      if (_pageController.page?.round() == moviesData.length - 1 &&
          notification.overscroll > 0) {
        _loadMoreMovies();
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: Stack(
          children: [
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state.status == MovieStatus.loading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                } else if (state.status == MovieStatus.loaded) {
                  final movies = state.movies;
                  return PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    physics: const _SnappyScrollPhysics(),
                    itemCount: moviesData.length,
                    itemBuilder: (context, index) {
                      return CardMovieSwipeable(movie: movies[index]);
                    },
                  );
                } else if (state.status == MovieStatus.error) {
                  /// TODO: SNACKBAR
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }
                return const SizedBox.shrink();
              },
            ),
            if (_isLoadingMore)
              Positioned(
                bottom: 150,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const SizedBox(
                      width: 35,
                      height: 35,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
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
