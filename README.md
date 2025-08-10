# 🎬 Case Study: Movies Project

A feature-rich Flutter application demonstrating clean architecture principles, BLoC state management, and modern Flutter development best practices.
Showcase project using Flutter, Bloc state management, API integration, authentication and custom UI with modular, reusable design.

---

![Movies App Preview](assets/images/dummy_movie_pic.png)

---

## Project Structure

```bash
lib/
├── *models/
│   ├── auth_model.dart
│   ├── user_model.dart
│   ├── movie_model.dart
│   └── token_model.dart
│   │
│   └── *response_models/
│       ├── auth_response.model.dart
│       ├── user_response.model.dart
│       └── movie_response_model.dart
│
├── *services/
│   └── *global_services/
│   │   ├── api_client.dart
│   │   ├── navigation_service.dart
│   │   ├── navigation_redirect_service.dart
│   │   └── dependency_injection_service.dart
│   │
│   └── *abstract_classes/
│   │   ├── i_auth_service.dart
│   │   ├── i_user_service.dart
│   │   ├── i_movie_service.dart
│   │   ├── i_logger_service.dart
│   │   └── i_token_storage_service.dart
│   │
│   ├── firebase_logger_service.dart
│   ├── token_storage_service.dart
│   ├── image_handler_service.dart
│   ├── nodelabs_auth_service.dart
│   ├── nodelabs_user_service.dart
│   └── nodelabs_movie_service.dart
│
├── *ui/
│   └── *blocs/
│   │   ├── auth_bloc.dart
│   │   ├── auth_state.dart
│   │   ├── auth_event.dart
│   │   ├── user_bloc.dart
│   │   ├── user_state.dart
│   │   ├── user_event.dart
│   │   ├── movie_bloc.dart
│   │   ├── movie_state.dart
│   │   ├── movie_event.dart
│   │   │
│   │   └── *cubits/
│   │       ├── theme_cubit.dart
│   │       ├── auth_form_cubit.dart
│   │       ├── lottie_animation_cubit.dart
│   │       └── navigation_bar_cubit.dart
│   │
│   └── *screens/
│   │   ├── home_screen.dart
│   │   ├── profile_details_screen.dart
│   │   ├── splash_screen.dart
│   │   ├── signin_screen.dart
│   │   ├── signup_screen.dart
│   │   ├── limited_offer_screen.dart
│   │   ├── upload_photo_screen.dart
│   │   └── terms_and_conditions_screen.dart
│   │
│   └── *widgets/
│   │   └── *appbars/
│   │   │   ├── appbar_custom.dart
│   │   │   └── appbar_sliver_profile.dart
│   │   │
│   │   └── *buttons/
│   │   │   ├── button_favorite.dart
│   │   │   ├── button_lite.dart
│   │   │   ├── button_main.dart
│   │   │   ├── button_navigation_bar.dart
│   │   │   ├── button_profile.dart
│   │   │   └── button_text.dart
│   │   │
│   │   └── *cards/
│   │   │   ├── card_movie_description.dart
│   │   │   ├── card_movie_swipeable.dart
│   │   │   ├── card_movie.dart
│   │   │   ├── card_profile.dart
│   │   │   ├── card_reward.dart
│   │   │   └── card_token.dart
│   │   │
│   │   └── *lotties/
│   │   │   ├── lottie_like_animation.dart
│   │   │   ├── lottie_loading_animation.dart
│   │   │   └── lottie_splash_animation.dart
│   │   │
│   │   └── *sections/
│   │   │   ├── section_card_tokens.dart
│   │   │   ├── section_rewards.dart
│   │   │   ├── section_settings_panel.dart
│   │   │   ├── section_social_login.dart
│   │   │   └── section_title_subtitle.dart
│   │   │
│   │   ├── scaffold_with_nav_bar.dart
│   │   ├── switch_cupertino_custom.dart
│   │   ├── text_custom.dart
│   │   └── textfield_custom.dart
│   
├── *utilities/
│   ├── k_app_constants.dart
│   ├── k_app_strings.dart
│   ├── k_app_themes.dart
│   ├── k_app_visuals.dart
│   ├── k_color_extensions.dart
│   ├── k_color_palette.dart
│   ├── k_extensions.dart
│   ├── k_routes.dart
│   ├── k_text_themes.dart
│   └── utilities_library_imports.dart
│
├── *assets/
│   ├── *fonts/
│   ├── *icons/
│   ├── *images/
│   ├── *translations/
│   └── *lotties/
│
├── .env
├── pubspec.yaml
├── firebase_options.dart
└── main.dart

```
</details>

### Clean Architecture — Long Form

<details>
<summary>Click to view alternative Clean Architecture foldering structure</summary>


```plaintext
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   ├── app_themes.dart
│   │   ├── assets.dart
│   │   └── routes.dart
│   ├── di/
│   │   └── locator.dart
│   ├── services/
│   │   ├── api/
│   │   │   ├── api_client.dart
│   │   │   └── auth_interceptor.dart
│   │   ├── auth_service.dart
│   │   ├── movie_service.dart
│   │   ├── token_storage_service.dart
│   │   └── user_service.dart
│   └── utils/
│       ├── extensions.dart
│       ├── logger_service.dart
│       └── pagination_helper.dart
│
├── data/
│   ├── models/
│   │   ├── movie_response_model.dart
│   │   └── user_response_model.dart
│   └── repositories/
│       ├── movie_repository.dart
│       └── user_repository.dart
│
├── presentation/
│   ├── blocs/
│   │   ├── auth/
│   │   ├── movie/
│   │   └── theme/
│   ├── cubits/
│   │   ├── textfield_validation_cubit.dart
│   │   ├── animation_cubit.dart
│   │   └── theme_cubit.dart
│   ├── pages/
│   │   ├── home_page.dart
│   │   ├── movie_detail_page.dart
│   │   └── profile_page.dart
│   └── widgets/
│       ├── custom_button.dart
│       ├── movie_card.dart
│       └── profile_avatar.dart
│
└── main.dart
```
</details>


---

## ✨ Key Features & Highlights

* **State Management:** BLoC for complex flows, Cubit for localized UI states (e.g., text field validation, animations, theme toggling).
* **Architecture:** MVVM-inspired with near-complete adherence to Clean Architecture principles.
* **Dependency Injection:** Implemented with GetIt for a decoupled service layer.
* **Navigation:** go\_router for type-safe and scalable routing.
* **Reusable UI Components:** Modular widgets used across screens.
* **Theming:** Light/dark theme switching with a central manager.
* **Pagination:** API-driven lists with lazy loading.
* **Logging:** Custom LoggerService with placeholders for Firebase Crashlytics & Analytics.
* **Secure Storage:** JWT token management with FlutterSecureStorage.
* **API Communication:** Dio with auth interceptors.
* **Animations:** Smooth transitions controlled via Cubits.
* **Extensibility:** Utilities for constants, colors, extensions, and asset management.


## Dependencies (on pubspec.yaml)
```yaml
############################################################################################
    
  flutter_bloc: ^9.1.1                        # State Management Solution
  get_it: ^8.2.0                              # Dependency Injection Service
  go_router: ^16.1.0                          # Advanced Navigation & Routing System
  dio: ^5.8.0+1                               # HTTP Networking Service
  flutter_secure_storage: ^9.2.4              # Secure Token Management Service
  image_picker: ^1.1.2                        # Upload from Device Gallery Functionality
  easy_localization: ^3.0.8                   # Language Localization Service

  firebase_core: ^4.0.0                       # Firebase Services | Root
  firebase_analytics: ^12.0.0                 # Firebase Analytics Service
  firebase_crashlytics: ^5.0.0                # Firebase Crashlytics Service        
  
  lottie: ^3.3.1                              # Optimized JSON Animations
  flutter_dotenv: ^5.2.1                      # Environment Variable Service
  flutter_animate: ^4.5.2                     # Advanced Animation Builder
  flutter_svg: ^2.0.7                         # SVG Icon Viewer
  image: ^4.5.4                               # Image Processor
  readmore: ^3.0.0                            # Expandable Text
  flutter_inset_box_shadow: ^1.0.8            # Custom Gradients
  flutter_spinkit: ^5.2.1                     # ProgressBar Animations
  cupertino_icons: ^1.0.6                     # UI Icons

############################################################################################
```
## main.dart
```dart 
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
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);  ...

   /// Bloc Implemented as State Management Solution
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => locator<AuthBloc>()..add(CheckAuthStatusEvent());  ...
   /// Go_Router Implemented as Advanced Navigation Solution
          routerConfig: AppRouter.router,
          localizationsDelegates: context.localizationDelegates,  ...

   /// Custom Dark/Light Mode Themes Implemented
          themeMode: themeMode,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,  ...
```

## Model Class Example
```dart
import 'dart:convert';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class MovieModel {
  final String id;
  final String title;
  final String description;
  final String posterUrl;

  MovieModel({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
  });

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        id: json["id"] ?? json["_id"] ?? '',
        title: json["Title"] ?? json["title"] ?? '',
        description: json["Plot"] ?? json["description"] ?? '',
        posterUrl:
            (json["Poster"] ?? json["posterUrl"] ?? '').toString().withHttps,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "posterUrl": posterUrl,
      };

  factory MovieModel.fromJson(String str) =>
      MovieModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  MovieModel copyWith({
    String? id,
    String? title,
    String? description,
    String? posterUrl,
  }) =>
      MovieModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        posterUrl: posterUrl?.toString().withHttps ?? this.posterUrl,
      );

  @override
  String toString() {
    return 'MovieModel(id: $id, title: $title, description: $description, posterUrl: $posterUrl)';
  }
}
```

## IAbstact Class Example
```dart
abstract class IMovieService {
  Future<List<MovieModel>> getMovies({int page = 1});
  Future<List<MovieModel>> getFavoriteMovies();
  Future<bool> toggleFavorite(String favoriteId);
}
```

## Service Class Example

```dart
class NodeLabsMovieService extends IMovieService {
  final Dio _dio = locator<Dio>();

  @override
  Future<List<MovieModel>> getFavoriteMovies() async {
    const String endPoint = '/movie/favorites';

    try {
      final response = await _dio.get(endPoint);

      if (response.statusCode == 200) {
        final favMoviesResponse =
            FavoriteMoviesResponseModel.fromMap(response.data);

        return favMoviesResponse.movies; ... }

    } on DioException catch (_) {
      rethrow; 
    }
```

---

## BLoC Usage Example

```dart
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final IMovieService movieService;
  final _logger = locator<ILoggerService>();

  MovieBloc({required this.movieService}) : super(MovieState.initial()) {
    on<GetFavoriteMoviesEvent>(_onGetFavoriteMovies); ... }

Future<void> _onGetFavoriteMovies(
    GetFavoriteMoviesEvent event,
    Emitter<MovieState> emit
  ) async {
    
    _logger.logInfo('GetFavoriteMovies started');
    emit(state.copyWith(status: MovieStatus.loading));

    try {
      final favorites = await movieService.getFavoriteMovies();

      emit(state.copyWith(status: MovieStatus.loaded, favoriteMovies: favorites));
      _logger.logInfo(  ... 

    } catch (e, stack) {
      emit(state.copyWith(
          status: MovieStatus.error, errorMessage: e.toString()));
      _logger.logError(  ...

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final IMovieService movieService;

  MovieBloc(this.movieService) : super(MovieInitial()) {
    on<FetchMoviesEvent>(_onFetchMovies);
  }

  Future<void> _onFetchMovies(FetchMoviesEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await movieService.getMovies(page: event.page);
      emit(MovieLoaded(movies: movies));
    } catch (e) {
      emit(MovieError('Failed to load movies.'));
    }
  }
}
```

---

## 📌 Completed Development Milestones

* Authentication Service – Login & Register.
* Token Management – Secure storage and validation.
* User Service – Profile retrieval and photo upload.
* Movie Service – Fetch, list, and toggle favorites.
* API Client & Interceptors – Centralized request handling.
* Response Models – Strongly typed.
* Logger Service – Centralized logging.
* UI Components – Modular and reusable.
* Dark/Light Theme – Real-time switching.
* Splash & Icons – Custom launch assets.

---

## 📅 Future Enhancements

* Firebase Crashlytics & Analytics integration.
* Localization for multi-language support.
* Expanded unit & widget test coverage.
* Offline Mode with caching.
* Infinite scrolling pagination.

---

## 📄 License

This project is distributed under the MIT License. See LICENSE for details.
