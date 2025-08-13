import 'package:flutter_bloc/flutter_bloc.dart';

class PaginationCubit extends Cubit<bool> {
  PaginationCubit() : super(false);
  int currentPage = 1;

  Future<void> loadMore(Future<void> Function(int page) loadFunction) async {
    if (state) return;

    emit(true);

    currentPage++;
    await loadFunction(currentPage);
    await Future.delayed(const Duration(milliseconds: 1500));

    emit(false);
  }
}
