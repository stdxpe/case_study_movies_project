import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:case_study_movies_project/firebase_options.dart';
import 'package:case_study_movies_project/ui/bloc/auth_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/user_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/user_event.dart';
import 'package:case_study_movies_project/ui/bloc/auth_event.dart';
import 'package:case_study_movies_project/ui/bloc/movie_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/movie_event.dart';
import 'package:case_study_movies_project/ui/bloc/theme_cubit.dart';
import 'package:case_study_movies_project/ui/bloc/auth_form_cubit.dart';
import 'package:case_study_movies_project/ui/bloc/lottie_animation_cubit.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';
import 'package:case_study_movies_project/services/global_services/dependency_injection_service.dart';
import 'package:case_study_movies_project/services/global_services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// DotEnv Implemented as Environment Variable Solution
  await dotenv.load(fileName: AppConstants.envPath);

  /// Firebase Implemented as Cloud Solution
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// GetIt Implemented as Dependency Injection Solution
  initializeDependencyInjectionService();

  /// EasyLocalization Implemented as Localization Service
  await EasyLocalization.ensureInitialized();

  /// Firebase Crashlytics Implemented as Remote Logger Service
  FlutterError.onError = (errorDetails) =>
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(
    EasyLocalization(
      path: Localization.path,
      fallbackLocale: const Locale(Localization.turkish),
      supportedLocales: const [
        Locale(Localization.english),
        Locale(Localization.turkish),
      ],
      child: const RootApp(),
    ),
  );
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Bloc Implemented as State Management Solution
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => locator<AuthBloc>()..add(CheckAuthStatusEvent()),
        ),
        BlocProvider<UserBloc>(
          create: (_) => locator<UserBloc>()..add(GetUserProfileEvent()),
        ),
        BlocProvider<MovieBloc>(
          create: (_) => locator<MovieBloc>()
            ..add(GetMoviesEvent(page: 1))
            ..add(GetFavoriteMoviesEvent()),
        ),
        BlocProvider<AuthFormCubit>(create: (_) => locator<AuthFormCubit>()),
        BlocProvider<ThemeCubit>(create: (_) => locator<ThemeCubit>()),
        BlocProvider<LottieAnimationCubit>(
            create: (_) => locator<LottieAnimationCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, themeMode) {
        return MaterialApp.router(
          title: AppConstants.appTitle,

          /// Custom Dark/Light Mode Themes Implemented
          themeMode: themeMode,
          darkTheme: AppThemes.dark,
          theme: AppThemes.light,
          themeAnimationDuration: const Duration(milliseconds: 10),

          /// Go_Router Implemented as Advanced Navigation Solution
          routerConfig: AppRouter.router,
          localizationsDelegates: context.localizationDelegates,

          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
