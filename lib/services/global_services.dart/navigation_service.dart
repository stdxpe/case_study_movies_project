import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:case_study_movies_project/services/global_services.dart/dependency_injection_service.dart';
import 'package:case_study_movies_project/services/global_services.dart/navigation_redirect_service.dart';
import 'package:case_study_movies_project/ui/bloc/auth_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/navigation_bar_cubit.dart';
import 'package:case_study_movies_project/ui/screens/home_screen.dart';
import 'package:case_study_movies_project/ui/screens/limited_offer_screen.dart';
import 'package:case_study_movies_project/ui/screens/profile_details_screen.dart';
import 'package:case_study_movies_project/ui/screens/signin_screen.dart';
import 'package:case_study_movies_project/ui/screens/signup_screen.dart';
import 'package:case_study_movies_project/ui/screens/splash_screen.dart';
import 'package:case_study_movies_project/ui/screens/terms_and_conditions_screen.dart';
import 'package:case_study_movies_project/ui/screens/upload_photo_screen.dart';
import 'package:case_study_movies_project/ui/widgets/scaffold_with_nav_bar.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: locator<NavigationService>().navigatorKey,
    refreshListenable: GoRouterRefreshStream(locator<AuthBloc>().stream),
    initialLocation: Routes.splash,
    redirect: (context, state) {
      return locator<NavigationRedirectService>().redirect(state.uri.path);
    },

    /// Route Definitions
    routes: [
      GoRoute(
        path: Routes.splash,
        pageBuilder: (context, state) =>
            buildFadePage(const SplashScreen(), state),
      ),
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
          path: Routes.termsAndConditions,
          pageBuilder: (context, state) =>
              buildFadePage(const TermsAndConditionsScreen(), state)),

      ///  Bottom Navigation Bar Screens | Built with GoRouter StatefulShellBranches
      /// for Preserving States for Each Tab Screen
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          locator<NavigationBarCubit>().attach(navigationShell);

          return ScaffoldWithBottomNavBar(
            navigationShell: navigationShell,
            children: const [HomeScreen(), ProfileDetailsScreen()],
          );
        },
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
                path: Routes.home,
                builder: (context, state) => const HomeScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: Routes.profile,
                builder: (context, state) => const ProfileDetailsScreen()),
          ]),
        ],
      ),

      GoRoute(
        path: Routes.uploadPhotos,
        pageBuilder: (context, state) =>
            buildFadePage(const UploadPhotosScreen(), state),
      ),
      GoRoute(
          path: Routes.limitedOffer,
          pageBuilder: (context, state) =>
              buildFadePage(const LimitedOfferScreen(), state)),
    ],
  );
}

/// Screen Transition Animation Builder | Fade.easeIn | 600 milliseconds
CustomTransitionPage buildFadePage(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 400),
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

  Future<void> goTo(String location, {Object? extra}) async =>
      _context?.go(location, extra: extra);

  Future<void> push(String location, {Object? extra}) async =>
      _context?.push(location, extra: extra);

  Future<void> pushReplacement(String location, {Object? extra}) async =>
      _context?.pushReplacement(location, extra: extra);

  void pop<T extends Object?>([T? result]) => _context?.pop(result);

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

/// AuthBloc.stream Implementation for GoRouter
/// Usage: refreshListenable: GoRouterRefreshStream(locator<AuthBloc>().stream)
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
