import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:case_study_movies_project/services/abstract_classes/i_auth_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_movie_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_token_storage_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_user_service.dart';
import 'package:case_study_movies_project/services/global_services.dart/api_client.dart';
import 'package:case_study_movies_project/services/global_services.dart/navigation_service.dart';
import 'package:case_study_movies_project/services/logger_service.dart';
import 'package:case_study_movies_project/services/nodelabs_auth_service.dart';
import 'package:case_study_movies_project/services/nodelabs_movie_service.dart';
import 'package:case_study_movies_project/services/nodelabs_user_service.dart';
import 'package:case_study_movies_project/services/token_storage_service.dart';
import 'package:case_study_movies_project/ui/bloc/auth_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/movie_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/navigation_bar_cubit.dart';
import 'package:case_study_movies_project/ui/bloc/user_bloc.dart';

var locator = GetIt.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// [DEPENDENCY INJECTION SERVICE]

void initializeDependencyInjectionService() {
  /// Flutter Secure Storage Instance Implementation
  locator.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());

  /// Token Storage Service (Data Access Layer)
  locator
      .registerLazySingleton<ITokenStorageService>(() => TokenStorageService());

  /// HTTP Client Registered as Dio
  locator.registerSingleton(ApiClient());
  locator.registerSingleton(locator<ApiClient>().getDio());

  /// Auth Service (Data Access Layer)
  locator.registerLazySingleton<IAuthService>(() => NodeLabsAuthService());

  /// User Service (Data Access Layer)
  locator.registerLazySingleton<IUserService>(() => NodeLabsUserService());

  /// Movie Service (Data Access Layer)
  locator.registerLazySingleton<IMovieService>(() => NodeLabsMovieService());

  /// Logger Service (Global Service)
  locator.registerLazySingleton<ILoggerService>(() => LoggerService());

  /// All Bloc's Registered with Service Class Constructors via GetIt DI
  locator.registerFactory<AuthBloc>(() => AuthBloc(authService: locator()));
  locator.registerFactory<UserBloc>(() => UserBloc(userService: locator()));
  locator.registerFactory<MovieBloc>(() => MovieBloc(movieService: locator()));

  /// GoRouter Registered as Advanced Navigation & Routing System
  locator.registerSingleton<NavigationService>(NavigationService(navigatorKey));
  locator.registerSingleton<NavigationBarCubit>(NavigationBarCubit(null));
}
