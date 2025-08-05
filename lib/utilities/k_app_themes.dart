part of 'utilities_library_imports.dart';

/// [APP WIDE GLOBAL VARIABLE]
abstract class AppThemes {
  /// [DARK THEME]
  static final ThemeData dark =
      ThemeData(fontFamily: AppConstants.fontNames.euclid).copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColorsThemeExtension.dark.scaffoldBackground,
    extensions: const <ThemeExtension<dynamic>>[AppColorsThemeExtension.dark],
    textTheme: AppTextThemes.textTheme,
    primaryTextTheme: AppTextThemes.textTheme,
  );

  /// [LIGHT THEME]
  static final ThemeData light =
      ThemeData(fontFamily: AppConstants.fontNames.euclid).copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColorsThemeExtension.light.scaffoldBackground,
    extensions: const <ThemeExtension<dynamic>>[AppColorsThemeExtension.light],
    textTheme: AppTextThemes.textTheme,
    primaryTextTheme: AppTextThemes.textTheme,
  );
}
