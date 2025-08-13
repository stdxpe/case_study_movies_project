import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:case_study_movies_project/ui/bloc/movie_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/movie_event.dart';
import 'package:case_study_movies_project/ui/bloc/pagination_cubit.dart';
import 'package:case_study_movies_project/ui/bloc/movie_state.dart';
import 'package:case_study_movies_project/ui/widgets/card_movie_swipeable.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MovieBloc, MovieState>(
        listenWhen: (prev, curr) =>
            prev.allMovies.length != curr.allMovies.length,
        listener: (context, movieState) {
          final newCount = movieState.allMovies.length;

          if (newCount > _previousMovieCount) {
            final currentPageIndex = (_pageController.page ?? 0).round();
            final oldLastPageIndex = _previousMovieCount - 1;

            if (currentPageIndex == oldLastPageIndex &&
                _pageController.hasClients) {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                await Future.delayed(const Duration(milliseconds: 1350));
                if (_pageController.hasClients) {
                  _pageController.animateToPage(
                    currentPageIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              });
            }
            _previousMovieCount = newCount;
          }
        },
        child: BlocBuilder<PaginationCubit, bool>(
          builder: (context, isLoading) {
            return BlocBuilder<MovieBloc, MovieState>(
              builder: (context, movieState) {
                final movies = movieState.allMovies;
                return NotificationListener<OverscrollNotification>(
                  onNotification: (notification) {
                    if (notification.overscroll >= 8 && !isLoading) {
                      context.read<PaginationCubit>().loadMore((page) async {
                        context
                            .read<MovieBloc>()
                            .add(GetMoviesEvent(page: page));
                      });
                      return true;
                    }
                    return false;
                  },
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        scrollDirection: Axis.vertical,
                        physics: const _SnappyScrollPhysics(),
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return CardMovieSwipeable(movie: movies[index]);
                        },
                      ),
                      if (isLoading)
                        const Positioned(
                          bottom: 150,
                          left: 0,
                          right: 0,
                          child: SpinKitRing(
                            color: ColorPalette.permaWhite,
                            size: 55,
                            duration: Duration(milliseconds: 850),
                            lineWidth: 13,
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  int _previousMovieCount = 0;
}

class _SnappyScrollPhysics extends ClampingScrollPhysics {
  const _SnappyScrollPhysics({super.parent});

  @override
  ClampingScrollPhysics applyTo(ScrollPhysics? ancestor) =>
      _SnappyScrollPhysics(parent: buildParent(ancestor));

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    final normalized = (offset.abs() / 100).clamp(0.0, 1.0);
    final eased = Curves.easeInCubic.transform(normalized);
    return eased * 100 * offset.sign;
  }
}
