import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:case_study_movies_project/services/abstract_classes/i_auth_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_movie_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_token_storage_service.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_user_service.dart';
import 'package:case_study_movies_project/services/global_services.dart/api_client.dart';
import 'package:case_study_movies_project/services/nodelabs_auth_service.dart';
import 'package:case_study_movies_project/services/nodelabs_movie_service.dart';
import 'package:case_study_movies_project/services/nodelabs_user_service.dart';
import 'package:case_study_movies_project/services/token_storage_service.dart';

var locator = GetIt.instance;

/// [DEPENDENCY INJECTION SERVICE]

void initializeDependencyInjectionService() {
  /// API Client Registered as Dio
  locator.registerSingleton(ApiClient());
  locator.registerSingleton(locator<ApiClient>().getDio());

  /// Auth Service (Data Access Layer)
  locator.registerLazySingleton<IAuthService>(() => NodeLabsAuthService());

  /// User Service (Data Access Layer)
  locator.registerLazySingleton<IUserService>(() => NodeLabsUserService());

  /// Movie Service (Data Access Layer)
  locator.registerLazySingleton<IMovieService>(() => NodeLabsMovieService());

  /// Token Storage Service (Data Access Layer)
  locator
      .registerLazySingleton<ITokenStorageService>(() => TokenStorageService());

  /// Flutter Secure Storage Instance Implementation
  locator.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  // var getIt = GetIt.instance;
  // getIt.registerFactory(() => UsersBloc(usersRepository: getIt)));
}
