import 'package:flutter_bloc/flutter_bloc.dart';

class LottieAnimationState {
  final bool isLiked;
  final bool showAnimation;

  LottieAnimationState({required this.isLiked, required this.showAnimation});

  LottieAnimationState copyWith({bool? isLiked, bool? showAnimation}) {
    return LottieAnimationState(
      isLiked: isLiked ?? this.isLiked,
      showAnimation: showAnimation ?? this.showAnimation,
    );
  }
}

class LottieAnimationCubit extends Cubit<LottieAnimationState> {
  LottieAnimationCubit()
      : super(LottieAnimationState(isLiked: false, showAnimation: false));

  void update({required bool isLiked, required bool showAnimation}) {
    emit(state.copyWith(isLiked: isLiked, showAnimation: showAnimation));

    if (showAnimation) {
      Future.delayed(const Duration(milliseconds: 1100), () {
        emit(state.copyWith(showAnimation: false));
      });
    }
  }
}
