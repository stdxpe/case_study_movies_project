import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Manages BottomNavigationBar tab changes using go_router StatefulNavigationShell
/// Allows us to change the active tab index anywhere in the app,
class NavigationBarCubit extends Cubit<int> {
  NavigationBarCubit(this._shell) : super(0);

  StatefulNavigationShell? _shell;

  void attach(StatefulNavigationShell shell) {
    _shell ??= shell;
    emit(shell.currentIndex);
  }

  void goTab(int index) {
    if (_shell == null || index == state) return;
    _shell!.goBranch(index);
    emit(index);
  }
}
