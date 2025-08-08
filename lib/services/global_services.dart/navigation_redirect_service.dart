import 'package:case_study_movies_project/ui/bloc/auth_bloc.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class NavigationRedirectService {
  final AuthBloc authBloc;

  NavigationRedirectService({required this.authBloc});

  String? redirect(String currentLocation) {
    final isAuthenticated = authBloc.state.isAuthenticated;

    switch (currentLocation) {
      /// Auth Required Routes | Redirects to SignInScreen if not authenticated (through SplashScreen)
      case Routes.home:
      case Routes.profile:
      case Routes.uploadPhotos:
      case Routes.limitedOffer:
        if (!isAuthenticated) return Routes.splash;
        return null;

      /// Public Routes | Redirects to HomeScreen if authenticated (through SplashScreen)
      case Routes.signIn:
      case Routes.signUp:
      case Routes.termsAndConditions:
        if (isAuthenticated) return Routes.splash;
        return null;

      // Splash Route | No Redirection
      case Routes.splash:
        return null;

      /// Default Route | Dedirects to SplashScreen if auth state changes
      default:
        return Routes.splash;
    }
  }
}
