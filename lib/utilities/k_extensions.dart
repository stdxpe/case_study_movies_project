part of 'utilities_library_imports.dart';

/// [APP WIDE GLOBAL EXTENSIONS]

/// [EASY ACCESS to THEME DATA in UI]
/// Usage example:  `context.theme` --instead of `Theme.of(context)`
extension ThemeAccessExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

/// Usage example:  `context.colorPalette`
extension ColorPaletteExtension on BuildContext {
  AppColorsThemeExtension get colorPalette => Theme.of(this).colorPalette;
}

/// Usage example:  `context.theme.colorPalette`
extension ColorPaletteExtensionOnThemeData on ThemeData {
  AppColorsThemeExtension get colorPalette =>
      extension<AppColorsThemeExtension>() ?? AppColorsThemeExtension.dark;
}

/// Usage example:  `context.textTheme` --instead of `Theme.of(context).textTheme`
extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

/// Usage example:  `context.textTheme.title`
/// Custom semantic naming getters for commonly used text styles in the application,
/// replaces Material Design and Flutter's generic names like displaySmall or bodyMedium...
extension CustomTextStylesExtension on TextTheme {
  TextStyle get title => headlineMedium!;
  TextStyle get subtitle => bodyMedium!;
  TextStyle get infoLight => labelSmall!;
  TextStyle get infoBold => labelLarge!;
  TextStyle get action => titleMedium!;
  TextStyle get tokenMontserrat => displayLarge!;
}

/// Usage example:  `context.mediaQuery.size.height`
extension BuildContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  NavigatorState get navigator => Navigator.of(this);

  FocusScopeNode get focusScope => FocusScope.of(this);

  ScaffoldState get scaffold => Scaffold.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

extension EnforceHttps on String {
  String get withHttps => replaceFirst(RegExp(r'^https?:\/\/'), 'https://');
}

extension FirstWordsExtension on String {
  String firstWords(int count) {
    final words = trim().split(RegExp(r'\s+'));
    return words.take(count).join(' ');
  }
}

extension MovieCardHeightExtension on BuildContext {
  double get movieCardTotalHeight {
    final screenWidth = mediaQuery.size.width;
    final horizontalPadding = AppConstants.paddings.size17 * 2;
    final crossAxisSpacing = AppConstants.spacings.space16;

    final availableWidth = screenWidth - horizontalPadding - crossAxisSpacing;
    final cardWidth = availableWidth / 2;

    final imageAspectRatio =
        AppConstants.sizes.movieCardHeight / AppConstants.sizes.movieCardWidth;
    final imageHeight = cardWidth * imageAspectRatio;

    final spacing = AppConstants.spacings.space16;
    final spacingSafe = AppConstants.spacings.space8;

//     [ALTERNATIVE]
//     Definitive, but not performant
//     double textHeight(TextStyle style) {
//       final tp = TextPainter(
//         text: TextSpan(text: 'A', style: style),
//         maxLines: 1,
//         textDirection: TextDirection.ltr,
//       )..layout();
//       return tp.height;
//     }

    final titleStyle =
        theme.textTheme.infoLight.copyWith(fontWeight: FontWeight.w500);
    final subtitleStyle = theme.textTheme.infoLight;

    final totalTextHeight = (titleStyle.fontSize! * titleStyle.height!) +
        (subtitleStyle.fontSize! * subtitleStyle.height!);

    return imageHeight + spacing + spacingSafe + totalTextHeight;
  }
}
