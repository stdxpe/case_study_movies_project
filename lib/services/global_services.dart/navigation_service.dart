import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:case_study_movies_project/services/global_services.dart/dependency_injection_service.dart';
import 'package:case_study_movies_project/ui/bloc/navigation_bar_cubit.dart';
import 'package:case_study_movies_project/ui/screens/discover_screen.dart';
import 'package:case_study_movies_project/ui/screens/profile_details_screen.dart';
import 'package:case_study_movies_project/ui/screens/signin_screen.dart';
import 'package:case_study_movies_project/ui/screens/signup_screen.dart';
import 'package:case_study_movies_project/ui/screens/upload_photo_screen.dart';
import 'package:case_study_movies_project/ui/widgets/scaffold_with_nav_bar.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: locator<NavigationService>().navigatorKey,
    initialLocation: Routes.signIn,
    routes: [
      GoRoute(
        path: Routes.signIn,
        pageBuilder: (context, state) =>
            buildFadePage(const SignInScreen(), state),
      ),
      GoRoute(
        path: Routes.signUp,
        pageBuilder: (context, state) =>
            buildFadePage(const SignUpScreen(), state),
      ),
      GoRoute(
        path: Routes.uploadPhotos,
        pageBuilder: (context, state) =>
            buildFadePage(const UploadPhotosScreen(), state),
      ),

      ///  Bottom Navigation Bar Screens | Built with GoRouter StatefulShellBranches
      /// for Preserving States for Each Tab Screen
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          locator<NavigationBarCubit>().attach(navigationShell);

          return ScaffoldWithBottomNavBar(
            navigationShell: navigationShell,
            children: const [DiscoverScreen(), ProfileDetailsScreen()],
          );
        },
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
                path: Routes.discover,
                builder: (context, state) => const DiscoverScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: Routes.profile,
                builder: (context, state) => const ProfileDetailsScreen()),
          ]),
        ],
      ),
    ],
  );
}

/// Screen Transition Animation Builder | Fade.easeIn | 600 milliseconds
CustomTransitionPage buildFadePage(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeIn,
      );
      return FadeTransition(
        opacity: curvedAnimation,
        child: child,
      );
    },
  );
}

/// Push, Pop, Go, PushReplacement Functionality
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationService(this.navigatorKey);

  BuildContext? get _context => navigatorKey.currentContext;

  Future<void> goTo(String location, {Object? extra}) async {
    _context?.go(location, extra: extra);
  }

  Future<void> push(String location, {Object? extra}) async {
    _context?.push(location, extra: extra);
  }

  Future<void> pushReplacement(String location, {Object? extra}) async {
    _context?.pushReplacement(location, extra: extra);
  }

  void pop<T extends Object?>([T? result]) {
    _context?.pop(result);
  }

  String get currentLocation {
    final router = GoRouter.of(_context!);
    return router.state.uri.toString();
  }

  void goToBranch(int index, {bool initialLocation = false}) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      final shell = StatefulNavigationShell.of(context);
      shell.goBranch(index, initialLocation: initialLocation);
    }
  }
}
