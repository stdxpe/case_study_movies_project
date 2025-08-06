import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:case_study_movies_project/ui/bloc/lottie_animation_cubit.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class LottieLikeAnimation extends StatefulWidget {
  const LottieLikeAnimation({super.key});

  @override
  State<LottieLikeAnimation> createState() => _LottieLikeAnimationState();
}

class _LottieLikeAnimationState extends State<LottieLikeAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool? lastIsLiked;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animate(bool isLiked) {
    if (isLiked) {
      _controller.animateTo(0.0, duration: Duration.zero);
      _controller.animateTo(0.5, duration: const Duration(milliseconds: 1000));
    } else {
      _controller.animateTo(0.5, duration: Duration.zero);
      _controller.animateTo(1.0, duration: const Duration(milliseconds: 1000));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LottieAnimationCubit, LottieAnimationState>(
      builder: (context, state) {
        if (!state.showAnimation) return const SizedBox.shrink();

        if (lastIsLiked != state.isLiked) {
          lastIsLiked = state.isLiked;
          _animate(state.isLiked);
        }

        return Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.0, 0.0),
              radius: 0.8,
              colors: [
                Colors.black.withAlpha(125),
                Colors.transparent,
              ],
              stops: const [0.0, 1.0],
            ),
          ),
          child: Center(
            child: SizedBox(
              width: 350,
              height: 350,
              child: Lottie.asset(
                AppVisuals.lottieLike,
                controller: _controller,
                frameRate: const FrameRate(60),
                onLoaded: (composition) {
                  _controller.duration = composition.duration;
                },
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 175.ms)
            .fadeOut(duration: 250.ms, delay: 750.ms);
      },
    );
  }
}
