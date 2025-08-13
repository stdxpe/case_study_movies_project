import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:case_study_movies_project/ui/bloc/auth_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/user_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/movie_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/theme_cubit.dart';
import 'package:case_study_movies_project/ui/bloc/auth_form_cubit.dart';
import 'package:case_study_movies_project/ui/bloc/pagination_cubit.dart';
import 'package:case_study_movies_project/ui/bloc/navigation_bar_cubit.dart';
import 'package:case_study_movies_project/services/image_handler_service.dart';
import 'package:case_study_movies_project/services/nodelabs_auth_service.dart';
import 'package:case_study_movies_project/services/nodelabs_user_service.dart';
import 'package:case_study_movies_project/ui/bloc/lottie_animation_cubit.dart';
import 'package:case_study_movies_project/services/nodelabs_movie_service.dart';
import 'package:case_study_movies_project/services/global_services/api_client.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_user_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_auth_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_movie_service.dart';
import 'package:case_study_movies_project/services/global_services/auth_interceptor.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
import 'package:case_study_movies_project/services/global_services/navigation_service.dart';
import 'package:case_study_movies_project/services/global_services/token_storage_service.dart';
import 'package:case_study_movies_project/services/global_services/firebase_logger_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_token_storage_service.dart';
import 'package:case_study_movies_project/services/global_services/navigation_redirect_service.dart';

var locator = GetIt.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// [DEPENDENCY INJECTION SERVICE]

void initializeDependencyInjectionService() {
  ////// Flutter Secure Storage Implemented
  locator.registerLazySingleton<FlutterSecureStorage>(() {
    return const FlutterSecureStorage();
  });

  /// Token Storage Service (Data Access Layer)
  locator.registerLazySingleton<ITokenStorageService>(() {
    return TokenStorageService();
  });

  /// Dio's Interceptor Class Registered with Token Source
  locator.registerFactory<AuthInterceptor>(() {
    return AuthInterceptor(tokenStorage: locator<ITokenStorageService>());
  });

  /// HTTP Client Registered as Dio
  locator.registerLazySingleton<ApiClient>(
      () => ApiClient(authInterceptor: locator<AuthInterceptor>()));
  locator.registerSingleton(locator<ApiClient>().getDio());

  /// Auth Service (Data Access Layer)
  locator.registerLazySingleton<IAuthService>(() => NodeLabsAuthService(
      client: locator<Dio>(),
      logger: locator<ILoggerService>(),
      tokenStorage: locator<ITokenStorageService>()));

  /// User Service (Data Access Layer)
  locator.registerLazySingleton<IUserService>(() => NodeLabsUserService(
      client: locator<Dio>(), logger: locator<ILoggerService>()));

  /// Movie Service (Data Access Layer)
  locator.registerLazySingleton<IMovieService>(() => NodeLabsMovieService(
      client: locator<Dio>(), logger: locator<ILoggerService>()));

  /// Image Picker Service (Data Access Layer)
  locator.registerLazySingleton<ImageHandlerService>(() {
    return ImageHandlerService();
  });

  /// Firebase Logger Service (Crashlytics & Analytics)
  locator.registerLazySingleton<ILoggerService>(() =>
      FirebaseLoggerService(analytics: locator(), crashlytics: locator()));
  locator.registerLazySingleton<FirebaseAnalytics>(
      () => FirebaseAnalytics.instance);
  locator.registerLazySingleton<FirebaseCrashlytics>(
      () => FirebaseCrashlytics.instance);

  /// All Bloc's Registered with Service Class Constructors via GetIt DI
  locator.registerSingleton<AuthBloc>(AuthBloc(
    authService: locator<IAuthService>(),
    logger: locator<ILoggerService>(),
  ));
  locator.registerFactory<UserBloc>(() => UserBloc(
        userService: locator<IUserService>(),
        logger: locator<ILoggerService>(),
        imageHandlerService: locator<ImageHandlerService>(),
      ));
  locator.registerFactory<MovieBloc>(() => MovieBloc(
        movieService: locator<IMovieService>(),
        logger: locator<ILoggerService>(),
      ));

  /// All Cubits's Registered with GetIt DI
  locator.registerFactory<LottieAnimationCubit>(() => LottieAnimationCubit());
  locator.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  locator.registerLazySingleton<PaginationCubit>(() => PaginationCubit());
  locator.registerFactory<AuthFormCubit>(() {
    return AuthFormCubit(authBloc: locator<AuthBloc>());
  });

  /// GoRouter Registered as Advanced Navigation & Routing System
  locator.registerSingleton<NavigationRedirectService>(
      NavigationRedirectService(authBloc: locator()));
  locator.registerSingleton<NavigationService>(NavigationService(navigatorKey));
  locator.registerSingleton<NavigationBarCubit>(NavigationBarCubit(null));
}
