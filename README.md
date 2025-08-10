# 🎬 Case Study: Movies Project

A feature-rich Flutter application demonstrating clean architecture principles, BLoC state management, and modern Flutter development best practices.

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

---

## 🔧 Example Service Implementation

```dart
class NodeLabsMovieService implements IMovieService {
  final ApiClient _client;

  NodeLabsMovieService(this._client);

  @override
  Future<List<Movie>> getMovies({int page = 1}) async {
    try {
      final response = await _client.get('/movies?page=$page');
      return (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
    } catch (e, stack) {
      LoggerService.instance.logError('Error fetching movies', e, stack);
      rethrow;
    }
  }

  @override
  Future<void> toggleFavorite(String movieId) async {
    await _client.post('/movies/$movieId/favorite');
  }
}
```

---

## 🛠 Example BLoC Usage

```dart
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
