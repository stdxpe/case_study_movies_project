import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:case_study_movies_project/services/global_services.dart/dependency_injection_service.dart';
import 'package:case_study_movies_project/services/global_services.dart/navigation_service.dart';
import 'package:case_study_movies_project/ui/bloc/auth_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/auth_event.dart';
import 'package:case_study_movies_project/ui/bloc/lottie_animation_cubit.dart';
import 'package:case_study_movies_project/ui/bloc/movie_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/movie_event.dart';
import 'package:case_study_movies_project/ui/bloc/user_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/user_event.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// GetIt Implemented as Dependency Injection Solution
  initializeDependencyInjectionService();
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Bloc Implemented as State Management Solution
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (_) => locator<AuthBloc>()..add(CheckAuthStatusEvent())),
        BlocProvider<UserBloc>(
            create: (_) => locator<UserBloc>()..add(GetUserProfileEvent())),
        BlocProvider(create: (_) => LottieAnimationCubit()),
        BlocProvider<MovieBloc>(
            create: (_) => locator<MovieBloc>()
              ..add(GetMoviesEvent(page: 1))
              ..add(GetFavoriteMoviesEvent())),
      ],
      child: MaterialApp.router(
        title: AppStrings.appTitle,
        themeMode: ThemeMode.dark,
        darkTheme: AppThemes.dark,
        theme: AppThemes.light,

        /// Go_Router Implemented as Advanced Navigation Solution
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
