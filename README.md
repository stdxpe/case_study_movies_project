
# Case Study: Movies Project

Clean structured Flutter showcase project, with **BLoC** State Management, **GetIt** Dependency Injection, **GoRouter** Navigation, JWT Authentication, Firebase Crashlytics & Analytics, localization, theming and modular UI with Lottie.

<!-- ![Movies App Preview](assets/images/dummy_movie_pic.png) -->
![](https://github.com/stdxpe/ecommerce_shopping_project/blob/dev/readme_doc/dark_mode.jpg)

> Clean structured Flutter showcase project, with **BLoC** State Management, **GetIt** Dependency Injection, **GoRouter** Navigation, JWT Authentication, Firebase Crashlytics & Analytics, localization, theming and modular UI with Lottie.

## Project Structure
```rust
❗ This project strictly follows CLEAN ARCHITECTURE dependency principles, but uses an alternative folder structure. Below this scheme, you can view the standard version.
```

```bash
lib/
├── >models/
│    ├── auth_model.dart
│    ├── user_model.dart
│    ├── movie_model.dart
│    └── token_model.dart
│    │
│    └── >response_models/
│         ├── auth_response.model.dart
│         ├── user_response.model.dart
│         └── movie_response_model.dart
│  
├── >services/
│    └── >global_services/
│    │    ├── api_client.dart
│    │    ├── navigation_service.dart
│    │    ├── navigation_redirect_service.dart
│    │    ├── firebase_logger_service.dart
│    │    ├── token_storage_service.dart
│    │    └── dependency_injection_service.dart
│    │ 
│    └── >abstract_classes/
│    │    ├── i_auth_service.dart
│    │    ├── i_user_service.dart
│    │    ├── i_movie_service.dart
│    │    ├── i_logger_service.dart
│    │    └── i_token_storage_service.dart
│    │ 
│    ├─── image_handler_service.dart
│    ├─── nodelabs_auth_service.dart
│    ├─── nodelabs_user_service.dart
│    └─── nodelabs_movie_service.dart
│  
├── >ui/ 
│    └── >blocs/
│    │    ├── auth_bloc.dart
│    │    ├── auth_state.dart
│    │    ├── auth_event.dart
│    │    ├── user_bloc.dart
│    │    ├── user_state.dart
│    │    ├── user_event.dart
│    │    ├── movie_bloc.dart
│    │    ├── movie_state.dart
│    │    ├── movie_event.dart
│    │    │
│    │    └── >cubits/
│    │         ├── theme_cubit.dart
│    │         ├── auth_form_cubit.dart
│    │         ├── lottie_animation_cubit.dart
│    │         └── navigation_bar_cubit.dart
│    │ 
│    └── >screens/
│    │    ├── home_screen.dart
│    │    ├── profile_details_screen.dart
│    │    ├── splash_screen.dart
│    │    ├── signin_screen.dart
│    │    ├── signup_screen.dart
│    │    ├── limited_offer_screen.dart
│    │    ├── upload_photo_screen.dart
│    │    └── terms_and_conditions_screen.dart
│    │ 
│    └── >widgets/
│         └── >appbars/
│         │    ├── appbar_custom.dart
│         │    └── appbar_sliver_profile.dart
│         │
│         └── >buttons/
│         │    ├── button_favorite.dart
│         │    ├── button_lite.dart
│         │    ├── button_main.dart
│         │    ├── button_navigation_bar.dart
│         │    ├── button_profile.dart
│         │    └── button_text.dart
│         │
│         └── >cards/
│         │    ├── card_movie_description.dart
│         │    ├── card_movie_swipeable.dart
│         │    ├── card_movie.dart
│         │    ├── card_profile.dart
│         │    ├── card_reward.dart
│         │    └── card_token.dart
│         │
│         └── >lotties/
│         │    ├── lottie_like_animation.dart
│         │    ├── lottie_loading_animation.dart
│         │    └── lottie_splash_animation.dart
│         │
│         └── >sections/
│         │    ├── section_card_tokens.dart
│         │    ├── section_rewards.dart
│         │    ├── section_settings_panel.dart
│         │    ├── section_social_login.dart
│         │    └── section_title_subtitle.dart
│         │
│         ├─── scaffold_with_nav_bar.dart
│         ├─── switch_cupertino_custom.dart
│         ├─── text_custom.dart
│         └─── textfield_custom.dart
│     
├── >utilities/
│    ├─── k_app_constants.dart
│    ├─── k_app_strings.dart
│    ├─── k_app_themes.dart
│    ├─── k_app_visuals.dart
│    ├─── k_color_extensions.dart
│    ├─── k_color_palette.dart
│    ├─── k_extensions.dart
│    ├─── k_routes.dart
│    ├─── k_text_themes.dart
│    └─── utilities_library_imports.dart
│  
├── >assets/
│    ├─── >fonts/
│    ├─── >icons/
│    ├─── >images/
│    ├─── >translations/
│    └─── >lotties/
│  
├─── .env 
├─── pubspec.yaml
├─── firebase_options.dart
└─── main.dart
 
```
### ✨ Clean Architecture Structure Scheme
```bash
> lib
  ├── domain
  ├── data
  ├── presentation
  └── core
```
<details>
<summary>🔽🔽  <b>Click to view the detailed Clean Architecture folder structure</b>  🔽🔽</summary>

&nbsp;

> Some files and classes might differ from Clean Architecture standard naming conventions, due to my background in C# and .NET traditions (and Uncle Tom of course ^^) (e.g. MovieRepository → IMovieService)


```bash

lib/
├── >domain/
│    ├── >models/
│    │    ├── auth_model.dart
│    │    ├── user_model.dart
│    │    ├── movie_model.dart
│    │    └── token_model.dart
│    │
│    ├── >repositories/ [ABSTRACT]
│    │    ├── i_auth_service.dart
│    │    ├── i_user_service.dart
│    │    └── i_movie_service.dart
│    │
│    └── >services/  [ABSTRACT]
│         ├── i_logger_service.dart
│         └── i_token_storage_service.dart.dart
│
├── >data/
│    ├── >datasources/
│    │    └── >remote/
│    │         ├── api_client.dart
│    │         └── auth_interceptor.dart
│    │
│    ├── >repositories/  [CONCRETE]
│    │    ├── nodelabs_auth_service.dart
│    │    ├── nodelabs_user_service.dart
│    │    └── nodelabs_movie_service.dart
│    │
│    ├── >models/
│    │    ├── auth_response_model.dart
│    │    ├── user_response_model.dart
│    │    └── movie_response_model.dart
│    │
│    └── >services/  [CONCRETE]
│         ├── image_handler_service.dart
│         ├── token_storage_service.dart
│         └── firebase_logger_service.dart
│
├── >presentation/
│    ├── >blocs/
│    │    ├── auth_bloc.dart
│    │    ├── auth_event.dart
│    │    ├── auth_state.dart
│    │    ├── user_bloc.dart
│    │    ├── user_event.dart
│    │    ├── user_state.dart
│    │    ├── movie_bloc.dart
│    │    ├── movie_event.dart
│    │    └── movie_state.dart
│    │
│    ├── >cubits/
│    │    ├── auth_form_cubit.dart
│    │    ├── lottie_animation_cubit.dart
│    │    ├── navigation_bar_cubit.dart
│    │    └── theme_cubit.dart
│    │
│    ├── >pages/
│    │    ├── home_screen.dart
│    │    ├── profile_details_screen.dart
│    │    ├── limited_offer_screen.dart
│    │    ├── signin_screen.dart
│    │    ├── signup_screen.dart
│    │    ├── splash_screen.dart
│    │    ├── upload_photo_screen.dart
│    │    └── terms_and_conditions_screen.dart
│    │
│    ├── >widgets/
│    │    ├── >appbars/
│    │    │    ├── appbar_custom.dart
│    │    │    └── appbar_sliver_profile.dart
│    │    │
│    │    ├── >buttons/
│    │    │    ├── button_main.dart
│    │    │    ├── button_favorite.dart
│    │    │    ├── button_lite.dart
│    │    │    ├── button_navigation_bar.dart
│    │    │    ├── button_profile.dart
│    │    │    └── button_text.dart
│    │    │
│    │    ├── >cards/
│    │    │    ├── card_movie.dart
│    │    │    ├── card_movie_description.dart
│    │    │    ├── card_movie_swipeable.dart
│    │    │    ├── card_profile.dart
│    │    │    ├── card_reward.dart
│    │    │    └── card_token.dart
│    │    │
│    │    ├── >lotties/
│    │    │    ├── lottie_like_animation.dart
│    │    │    ├── lottie_loading_animation.dart
│    │    │    └── lottie_splash_animation.dart
│    │    │
│    │    ├── >sections/
│    │    │    ├── section_card_tokens.dart
│    │    │    ├── section_rewards.dart
│    │    │    ├── section_settings_panel.dart
│    │    │    ├── section_social_login.dart
│    │    │    └── section_title_subtitle.dart
│    │    │
│    │    ├─── switch_cupertino_custom.dart
│    │    ├─── scaffold_with_nav_bar.dart
│    │    ├─── text_custom.dart
│    │    └─── textfield_custom.dart
│    │
│    └── >navigation/
│         ├─── navigation_service.dart
│         ├─── navigation_redirect_service.dart
│         └─── k_routes.dart
│
├── >core/
│    ├── >constants/
│    │    ├── k_app_constants.dart
│    │    ├── k_app_strings.dart
│    │    ├── k_app_themes.dart
│    │    ├── k_app_visuals.dart
│    │    ├── k_api_endpoints.dart
│    │    ├── k_color_palette.dart
│    │    └── k_text_themes.dart
│    │ 
│    ├── >extensions/
│    │    ├── k_color_extensions.dart
│    │    └── k_extensions.dart
│    │
│    └── >utilities/
│         └── utilities_library_imports.dart
│ 
├── >di/
│    └── dependency_injection_service.dart
│
├── >assets/
│    ├── >fonts/
│    ├── >icons/
│    ├── >images/
│    ├── >translations/
│    └── >lotties/
│
├── .env
├── pubspec.yaml
└── main.dart

```
</details>

Integrated Stripe API for the secure payment processing, ensuring seamless checkout flows with reliable and real-time transactions
Utilized Riverpod for State Management, get_it for Dependency Injection, and GoRouter for advanced Navigation/Routing service
Designed a modern, responsive UI with ScreenUtil and Figma, customized color palettes, dynamic theming, and Lottie animations
Enabled Google Sign-In and Firebase Auth for real-time user authentication and smooth onboarding experience
Implemented Firestore and Firebase Storage for cloud database solution, and Hive for local device storage and caching mechanism

> **Özellikler:**
> - Hızlı yükleme
> - Basit arayüz
> - Güvenli bağlantı

* [*] İlk madde
* [~] İkinci madde
* [!] Üçüncü madde

- Özellik 1 | Özellik 2 | Özellik 3

### Ana Özellikler
- Hızlı
- Güvenli
- Kolay Kullanım

Use `status` to list all new or modified files that haven't yet been committed.

- [x] #739
- [ ] https://github.com/octo-org/octo-repo/issues/740
- [ ] Add delight to the experience when all tasks are complete :tada:

- [ ] \(Optional) Open a followup issue

> [!NOTE]
> Useful information that users should know, even when skimming content.


## Features

> - **State Management:** Implemented `BLoC` for complex state flows and `Cubit` for local UI states (theme toggle, textfield validation, animation control).

- **Architecture:** Followed `clean architecture` principles with an alternative foldering structure.

- **Dependency Injection:** Registered all objects and abstractions via `GetIt` for centralized control.

- **Navigation:** Integrated `GoRouter` as an advanced navigation system with an automated redirect service.

- **Storage & Security:** Secured `JWT` tokens with `FlutterSecureStorage` and encrypted local storage.

- **Networking:** Implemented `Dio` as the main HTTP client with automated auth interceptors.

- **Pagination:** Created infinite scrolls with `pull-to-refresh`, using API-driven lists with lazy loading.

- **Logging:** Connected a centralized logger service with `Firebase Crashlytics & Analytics`.

- **Localization:** Implemented `multi-language` support with dynamic JSON-based translation files.

- **Splash & Icons:** Implemented splash screens and platform-optimized icons for iOS and Android.

- **Animations:** Utilized `Lottie` and `flutter_animate` to deliver interactive and dynamic screens.

- **Theming:** Integrated `dark/light` themes with embedded custom `color palettes` and `typography` styles.

- **Utilities:** App-wide globals handled elegantly under separate utility classes.


## ✅ Features & Milestones

- [x] **State Management:**  `BLoC` implemented for complex state flows and `Cubit` for local UI states (theme toggle, textfield validation, animation control).

- [x] **Architecture:**  "Clean architecture" principles followed with an alternative foldering structure.

- [x] **Dependency Injection:**  All objects and abstractions registered via `GetIt` for centralized control.

- [x] **Navigation:**  `GoRouter` integrated as an advanced navigation system with an automated redirect service.

- [x] **Storage & Security:**  "JWT" tokens secured with `FlutterSecureStorage` and encrypted local storage.

- [x] **Networking:**  `Dio` implemented as the main HTTP client with automated auth interceptors.

- [x] **Pagination:**  Infinite scrolls created with "pull-to-refresh", using API-driven lists with lazy loading.

- [x] **Logging:**  Centralized logger service connected with `Firebase Crashlytics & Analytics`.

- [x] **Localization:**  "Multi-language" support implemented with dynamic JSON-based translation files.

- [x] **Splash & Icons:**  Splash screens and platform-optimized icons implemented for iOS and Android.

- [x] **Animations:**  `Lottie` and `flutter_animate` utilized to deliver interactive and dynamic screens.

- [x] **Theming:**  "Dark/light" themes integrated with embedded custom "color palettes" and typography styles.

- [x] **Utilities:**  App-wide globals handled elegantly under separate utility classes.


## ✅ Features & Milestones

- [x] **State Management:**  `BLoC` implemented for complex state flows, and `Cubit` for localized UI states (theme toggling, textfield validations, animations..)
- [x] **Dependency Injection:**  `GetIt` implemented for centralized dependency control
- [x] **Navigation:**  `GoRouter` implemented for advanced navigation system
- [x] **Theming:**  `Dark` and `Light` mode theme integrated for different color palettes
- [x] **Animations:**  `Lottie` animations and `flutter_animate` package utilized
- [x] **Logging:**  `Firebase Crashlytics & Analytics` integrated for iOS and Android
- [x] **Secure Storage:**  `FlutterSecureStorage` implemented for `JWT` token management
- [x] **HTTP Client:**  `Dio` package utilized with automated auth interceptors
- [x] **Utilities:**  App-wide globals handled elegantly under separate utility classes
- [x] **Pagination:**  `Infinite scrolls` created for API-driven list with lazy loading
- [x] **Splash & Icons:**  Custom launch assets integrated
- [x] **Localization:**  Multiple language support implemented through JSON files
- [x] **Localization:**  Multiple language support implemented through JSON files
- ✅ **Localization:**  Multiple language support implemented through JSON files



## Dependencies (on pubspec.yaml)
```yaml
#########################################################################################
    
  flutter_bloc: ^9.1.1                        # State Management Solution
  get_it: ^8.2.0                              # Dependency Injection Service
  go_router: ^16.1.0                          # Advanced Navigation & Routing System
  dio: ^5.8.0+1                               # HTTP Networking Service
  flutter_secure_storage: ^9.2.4              # Secure Token Management Service
  image_picker: ^1.1.2                        # Upload from Gallery Functionality
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

#########################################################################################
```
## main.dart
```dart 
WidgetsFlutterBinding.ensureInitialized();

  /// DotEnv Implemented as Environment Variable Solution
  await dotenv.load(fileName: AppConstants.envPath);

  /// Firebase Crashlytics Implemented as Remote Logger Service
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);  
  FlutterError.onError = (errorDetails) =>
  FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);  

  /// GetIt Implemented as Dependency Injection Service
  initializeDependencyInjectionService();

  /// EasyLocalization Implemented as Localization Service
  await EasyLocalization.ensureInitialized();  ...            

  /// Bloc Implemented as State Management Solution
  MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
        create: (_) => locator<AuthBloc>()..add(CheckAuthStatusEvent());
      BlocProvider<UserBloc>(
        create: (_) => locator<UserBloc>()..add(GetUserProfileEvent());
      BlocProvider<ThemeCubit>(create: (_) => locator<ThemeCubit>()),  ...

  /// Go_Router Implemented as Advanced Navigation Solution
  routerConfig: AppRouter.router,
  localizationsDelegates: context.localizationDelegates,  ...

  /// Custom Dark/Light Mode Themes Implemented
  themeMode: themeMode,
  theme: AppThemes.light,
  darkTheme: AppThemes.dark,  ...
```

## Model/Entity Class Example
```dart
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

  factory MovieModel.fromJson(String str) => MovieModel.fromMap(json.decode(str));

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
    return 'MovieModel(id: $id, title: $title, description: $description ... )';
  }
}
```

## Abstract Class Example
```dart
abstract class IMovieService {
  
  Future<List<MovieModel>> getMovies({int page});
  Future<List<MovieModel>> getFavoriteMovies();
  Future<bool> toggleFavorite({String favoriteId});
}
```

## Dependency Injection Example
```dart
/// Auth Service (Data Access Layer)
locator.registerLazySingleton<IAuthService>(() => 
  NodeLabsAuthService(client: locator(), logger: locator(), tokenStorage: locator()));

/// User Service (Data Access Layer)
locator.registerLazySingleton<IUserService>(() => 
    NodeLabsUserService(client: locator(), logger: locator()));

/// Movie Service (Data Access Layer)
locator.registerLazySingleton<IMovieService>(() => 
    NodeLabsMovieService(client: locator(), logger: locator()));

/// All Bloc's Registered with Service Class Constructors via GetIt DI
locator.registerSingleton<AuthBloc>(() => 
    MovieBloc(authService: locator(), logger: locator()));

locator.registerFactory<UserBloc>(() => 
    UserBloc(userService: locator(), logger: locator(), imageService: locator()));

locator.registerFactory<MovieBloc>(() => 
    MovieBloc(movieService: locator(), logger: locator()));
...
```
/// TODO: dependencies injected through constructors
## Service Class Example

```dart
class NodeLabsMovieService extends IMovieService {
  final ApiClient client;
  final ILoggerService logger;

  NodeLabsMovieService({required this.client, required this.logger});

  @override
  Future<List<MovieModel>> getFavoriteMovies() async {
    const String endpoint = ApiEndpoints.favorites;

    try {
      logger.logInfo('GET $endPoint → Fetching items');
      final response = await client.get(endpoint);

      if (response.statusCode == 200) {
        final favMoviesResponse = FavoriteMoviesResponseModel.fromMap(response.data);
        logger.logInfo('Successfully fetched ${favMoviesResponse.movies.length} items from $endpoint');

        return favMoviesResponse.movies;

      } else if (response.statusCode == 401) {
        logger.logError('GET $endpoint → ${AppStrings.errors.unauthorized401}: ${response.statusCode}');
        throw Exception('${AppStrings.errors.unauthorized401}: ${response.statusCode}');

      } else {
        logger.logError('GET $endpoint → ${AppStrings.errors.unknown}: ${response.statusCode}');
        throw Exception('${AppStrings.errors.unknown}: ${response.statusCode}');
      }

    } on DioException catch (error, stacktrace) {
      logger.logError('GET $endpoint → Exception: $error $stacktrace');
      rethrow; 
    }
  }
}
```

---

## BLoC Example

```dart
class MovieBloc extends Bloc<MovieEvent, MovieState> {

  final IMovieService movieService;
  final ILoggerService logger;

  MovieBloc({required this.movieService, required this.logger}) : super(MovieState.initial()) {
    on<GetFavoriteMoviesEvent>(_onGetFavoriteMovies); ... }

...
Future<void> _onGetFavoriteMovies(event, emit) async {

    emit(state.copyWith(status: MovieStatus.loading));
    logger.logInfo( ...

    try {

      final favoriteMovies = await movieService.getFavoriteMovies();

      emit(state.copyWith(status: MovieStatus.loaded, favoriteMovies: favoriteMovies));
      logger.logInfo(  ... 

    } catch (e, stack) {

      emit(state.copyWith( status: MovieStatus.error, errorMessage: e.toString()));
      logger.logError(  ...
```

## UI BLoC Implementation Example
```dart
BlocBuilder<MovieBloc, MovieState> (builder: (context, state) {
switch (state.status) {

  case MovieStatus.loading:
      return const LottieLoadingAnimation();

  case MovieStatus.error:
      return const LottieErrorAnimation();

  case MovieStatus.loaded:
      final movies = state.favoriteMovies;

      return GridView.builder(
                itemCount: movies.length, ...
                itemBuilder: (context, index) {

                    return CardMovie(movie: movies[index]);
...
```

## UI Widget Example
```dart
class CardMovie extends StatelessWidget {
  const CardMovie({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.radius.movieCard),

          child: AspectRatio(
            aspectRatio: AppConstants.sizes.movieCardAspectRatio,

            child: Image.network(
              movie.posterUrl,
              fit: BoxFit.cover,
              height: AppConstants.sizes.movieCardHeight,
              loadingBuilder: (context, child, loadingProgress) {
                  return const LottieLoadingAnimation();   ...

        SizedBox(height: AppConstants.spacings.space16),

        TextCustom(
          text: movie.title,
          textStyle: context.textTheme.infoBold,
          color: context.colorPalette.text,
        ),

        TextCustom(
          text: movie.description,
          textStyle: context.textTheme.infoLight,
          color: context.colorPalette.textFaded05,
        ),
...
```

## UI General Example
```dart
 @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthFormCubit>(
      create: (context) => AuthFormCubit(authBloc: context.read<AuthBloc>()),

      child: BlocBuilder<AuthFormCubit, AuthFormState>(
        builder: (context, state) {
          final cubit = context.read<AuthFormCubit>();

          return Scaffold(
            backgroundColor: context.colorPalette.scaffoldBackground,
            
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: SizedBox(
                height: context.mediaQuery.size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    SectionTitleSubtitle(
                      title: AppStrings.signInTitle,
                      subtitle: AppStrings.signInSubtitle,
                    ),

                    SizedBox(height: AppConstants.spacings.space40),

                    TextFieldCustom(
                      onChanged: cubit.emailChanged,
                      keyboardType: TextInputType.emailAddress,
                      hintText: AppStrings.hintEmail,
                      prefixIconPath: AppVisuals.mail,
                      prefixIconSize: AppConstants.sizes.iconMailHeight,
                    ),

                    SizedBox(height: AppConstants.spacings.space13),
                    
                    TextFieldCustom(
                      onChanged: cubit.passwordChanged,
                      onToggle: cubit.togglePasswordVisibility,
                      obscureText: state.isPasswordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: AppStrings.hintPassword,
                      prefixIconPath: AppVisuals.unlock,
                      prefixIconSize: AppConstants.sizes.iconUnlockHeight,
                      suffixIconPath: AppVisuals.hide,
                      suffixIconSize: AppConstants.sizes.iconHideHeight,
                    ),

                    SizedBox(height: AppConstants.spacings.space30),
                    
                    ButtonText(
                      buttonText: AppStrings.forgotPassword,
                      padding: EdgeInsets.symmetric(horizontal: AppConstants.paddings.screen),
                      isUnderlinedButton: true,
                      onPressed: () => context.push(Routes.forgotPassword),
                    ),
                     
                    SizedBox(height: AppConstants.spacings.space24),

                    ButtonMain(
                      text: AppStrings.signInButton,
                      loading: state.isSubmitting,
                      onPressed: () => cubit.signIn(state.isValid, state.isSubmitting),
                    ),

                    SizedBox(height: AppConstants.spacings.space37),

                    const SectionSocialLogin(),

                    SizedBox(height: AppConstants.spacings.space32),

                    ButtonText(
                      leadingText: AppStrings.dontHaveAnAccount,
                      buttonText: AppStrings.dontHaveAnAccountButton,
                      onPressed: () => context.pushReplacement(Routes.signUp),
                    ),

                    SizedBox(height: AppConstants.paddings.screen),
                  ],
                ),   ...
```

## Extensions | Utility Classes Sample
```dart
/// [EASY ACCESS to THEME DATA in UI]
/// Usage example:  `context.theme` --instead of `Theme.of(context)`
extension ThemeAccessExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

/// Usage example:  `context.colorPalette`
extension ColorPaletteExtension on BuildContext {
  AppColorsThemeExtension get colorPalette => Theme.of(this).colorPalette;
}

/// Fix for the broken links from the API
extension EnforceHttpsExtension on String {
  String get withHttps => replaceFirst(RegExp(r'^https?:\/\/'), 'https://');
}
...
```

### Color Palette | Utility Classes Sample
```dart
/// [COLOR PALETTE] [APP-WIDE GLOBAL VARIABLE] 
/// Implemented into Flutter's Theming System through Extensions 
/// Usage example:  `context.colorPalette.scaffoldBackground`
abstract class ColorPalette {
  /// [DARK MODE THEME COLOR PALETTE]
  static const Color scaffoldBackground = Color(0xFF090909);
  static const Color buttonMainBackground = Color(0xFFE50914);
  static const Color buttonMainForeground = Color(0xFFFFFFFF); ...
```

### AppVisuals | Utility Classes Sample
```dart
/// [APP VISUALS] [APP-WIDE-GLOBAL VARIABLE] 
/// Usage example:  `AppVisuals.lottieLike`
abstract class AppVisuals {
  static const String lottieLike = "assets/lottie/like.json";
  static const String lottieLoading = "assets/lottie/loading.json"; ...
```

### AppStrings | Utility Classes Sample
```dart
/// [APP STRINGS] [APP-WIDE GLOBAL VARIABLE] 
/// Implemented into Language Localization System through JSON's
/// Usage example:  `AppStrings.errors.photoServerUploadFail` ...
abstract class AppStrings {
  String get loginFailedNoToken => 'loginFailedNoToken'.tr();
  String get photoServerUploadFail => 'photoServerUploadFail'.tr(); ...
  /// en.json → {.. "photoServerUploadFail": "Failed to upload photo to server", ..}
```

### AppConstants | Utility Classes Sample
```dart
/// [APP CONSTANTS] [APP-WIDE GLOBAL VARIABLE] 
/// Usage example:  `AppConstants.paddings.screen`
abstract class AppConstants {
  final double screen = 39;
  final double textFieldHorizontal = 30; ...
```

---
## 📄 License

This project is distributed under the MIT License. See LICENSE for details.
