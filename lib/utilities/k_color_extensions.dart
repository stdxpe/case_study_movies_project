part of 'utilities_library_imports.dart';

/// CUSTOM COLOR IMPLEMENTATION TO THEMES
@immutable
class AppColorsThemeExtension extends ThemeExtension<AppColorsThemeExtension> {
  @override
  AppColorsThemeExtension copyWith() => this;

  final Color scaffoldBackground;
  final Color buttonMainBackground;
  final Color buttonMainForeground;
  final Color buttonLiteBackground;
  final Color buttonLiteForeground;
  final Color buttonLiteBorder;
  final Color textFieldBackground;
  final Color textFieldForeground;
  final Color textFieldForegroundFaded;
  final Color textFieldBorder;
  final Color error;
  final Color text;
  final Color textFaded05;
  final Color textFaded075;
  final Color shadows;
  final Color navigationBar;
  final Color bottomSheetBackground;
  final Color bottomSheetGradientPrimary;
  final Color bottomSheetGradientSecondary;
  final Color bottomSheetGradientTertiary;

  const AppColorsThemeExtension({
    required this.scaffoldBackground,
    required this.buttonMainBackground,
    required this.buttonMainForeground,
    required this.buttonLiteBackground,
    required this.buttonLiteForeground,
    required this.buttonLiteBorder,
    required this.textFieldBackground,
    required this.textFieldForeground,
    required this.textFieldForegroundFaded,
    required this.textFieldBorder,
    required this.error,
    required this.text,
    required this.textFaded05,
    required this.textFaded075,
    required this.shadows,
    required this.navigationBar,
    required this.bottomSheetBackground,
    required this.bottomSheetGradientPrimary,
    required this.bottomSheetGradientSecondary,
    required this.bottomSheetGradientTertiary,
  });

  @override
  AppColorsThemeExtension lerp(
          covariant ThemeExtension<AppColorsThemeExtension>? other, double t) =>
      this;

  static const dark = AppColorsThemeExtension(
    scaffoldBackground: ColorPalette.scaffoldBackground,
    buttonMainBackground: ColorPalette.buttonMainBackground,
    buttonMainForeground: ColorPalette.buttonMainForeground,
    buttonLiteBackground: ColorPalette.buttonLiteBackground,
    buttonLiteForeground: ColorPalette.buttonLiteForeground,
    buttonLiteBorder: ColorPalette.buttonLiteBorder,
    textFieldBackground: ColorPalette.textFieldBackground,
    textFieldForeground: ColorPalette.textFieldForeground,
    textFieldForegroundFaded: ColorPalette.textFieldForegroundFaded,
    textFieldBorder: ColorPalette.textFieldBorder,
    error: ColorPalette.error,
    text: ColorPalette.text,
    textFaded05: ColorPalette.textFaded05,
    textFaded075: ColorPalette.textFaded075,
    shadows: ColorPalette.shadows,
    navigationBar: ColorPalette.navigationBar,
    bottomSheetBackground: ColorPalette.bottomSheetBackground,
    bottomSheetGradientPrimary: ColorPalette.bottomSheetGradientPrimary,
    bottomSheetGradientSecondary: ColorPalette.bottomSheetGradientSecondary,
    bottomSheetGradientTertiary: ColorPalette.bottomSheetGradientTertiary,
  );

  static const light = AppColorsThemeExtension(
    scaffoldBackground: ColorPalette.lightModeScaffoldBackground,
    buttonMainBackground: ColorPalette.lightModeButtonMainBackground,
    buttonMainForeground: ColorPalette.lightModeButtonMainForeground,
    buttonLiteBackground: ColorPalette.lightModeButtonLiteBackground,
    buttonLiteForeground: ColorPalette.lightModeButtonLiteForeground,
    buttonLiteBorder: ColorPalette.lightModeButtonLiteBorder,
    textFieldBackground: ColorPalette.lightModeTextFieldBackground,
    textFieldForeground: ColorPalette.lightModeTextFieldForeground,
    textFieldForegroundFaded: ColorPalette.lightModeTextFieldForegroundFaded,
    textFieldBorder: ColorPalette.lightModeTextFieldBorder,
    error: ColorPalette.lightModeError,
    text: ColorPalette.lightModeText,
    textFaded05: ColorPalette.lightModeTextFaded05,
    textFaded075: ColorPalette.lightModeTextFaded075,
    shadows: ColorPalette.lightModeShadows,
    navigationBar: ColorPalette.lightModeNavigationBar,
    bottomSheetBackground: ColorPalette.lightModeBottomSheetBackground,
    bottomSheetGradientPrimary:
        ColorPalette.lightModeBottomSheetGradientPrimary,
    bottomSheetGradientSecondary:
        ColorPalette.lightModeBottomSheetGradientSecondary,
    bottomSheetGradientTertiary:
        ColorPalette.lightModeBottomSheetGradientTertiary,
  );
}
