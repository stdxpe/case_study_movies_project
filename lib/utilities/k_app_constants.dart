part of 'utilities_library_imports.dart';

/// [APP WIDE GLOBAL VARIABLE]
abstract class AppConstants {
  static const paddings = _AppPaddings();
  static const spacings = _AppSpacings();
  static const radius = _AppRadius();
  static const sizes = _AppSizes();
  static const fontSizes = _FontSizes();
  static const fontNames = _FontNames();

  static const baseUrl = "https://caseapi.servicelabs.tech/";
}

class _AppPaddings {
  const _AppPaddings();

  final double screen = 39;
  final double textFieldHorizontal = 30;
  final double textFieldBorderToPrefixW = 25;
  final double textFieldSuffixtoBorderW = 30;
  final double textFieldTextHorizontal = 10;
  final double limitedOfferVertical = 7.68;
  final double limitedOfferHorizontal = 9.39;
  final double limitedOfferScreenHorizontal = 17;
  final double addPhotoHorizontal = 19;
  final double addPhotoVertical = 10;
  final double cardMovieDesc = 30;
  final double appBar = 24;
  final double size17 = 17;
  final double size26 = 25.69;
  final double navButtonVertical = 6.46;
  final double navButtonHorizontal = 16.4;
  final double favoriteButtonRight = 16.49;
  final double favoriteButtonBottom = 170;
  final double favoriteButtonVertical = 23.85;
  final double favoriteButtonHorizontal = 12.59;
  final double rewardCardTop = 22.25;
  final double rewardCardHorizontal = 20.25;
  final double rewardCardVertical = 14.25;
}

class _AppRadius {
  const _AppRadius();

  final double main = 18;
  final double navBarItem = 20;
  final double movieCard = 8;
  final double tokenCard = 16;
  final double percentCard = 24;
  final double bottomSheet = 32;
  final double bottomSheetGlass = 24;
  final double plusButton = 31;
  final double limitedOfferButton = 53;
  final double addPhotoButton = 8;
  final double circular = 100;
}

class _AppSizes {
  const _AppSizes();

  /// Screen width and height in the original Figma design.
  final double screenWidth = 414;
  final double screenHeight = 844;

  final double movieCardWidth = 153.13;
  final double movieCardHeight = 213.82;
  final double movieCardAspectRatio = 153.13 / 213.82;
  final double navBarItemHeight = 20;
  final double profilePhotoHeight = 61.91;
  final double textFieldHeight = 54.37;
  final double buttonHeight = 53.31;
  final double backButtonHeight = 44.34;
  final double socialButtonHeight = 60;
  final double limitedOfferButtonHeight = 35;
  final double plusButtonHeight = 168.95;
  final double borderWidth = 1.25;
  final double iconMailHeight = 15.73;
  final double iconUnlockHeight = 17;
  final double iconHideHeight = 17.09;
  final double iconUserHeight = 15.75;
  final double iconLogoHeight = 40;
  final double iconGoogleHeight = 20.4;
  final double iconAppleHeight = 23.74;
  final double iconFacebookHeight = 20;
  final double iconPlusHeight = 26.02;
  final double iconHeartHeight = 39.44;
  final double iconFavoriteHeight = 24;
  final double iconLeftArrowHeight = 12.05;
  final double iconHomeHeight = 23.33;
  final double iconProfileHeight = 28;
  final double iconGemHeight = 18;
  final double iconDiamondHeight = 33.31;
  final double appBarHeight = 70;
  final double profilePicHeight = 61.91;
  final double rewardCardHeight = 55;
  final double gradientHeight = 200;
}

class _AppSpacings {
  const _AppSpacings();

  final double space2 = 2;
  final double space4 = 4;
  final double space8 = 8;
  final double space12 = 12;
  final double space13 = 13.63;
  final double space16 = 16;
  final double space17 = 17.43;
  final double space20 = 20;
  final double space24 = 24;
  final double space30 = 30;
  final double space32 = 32;
  final double space37 = 37;
  final double space40 = 40;
  final double space47 = 40;
  final double space373 = 373;
}

class _FontSizes {
  const _FontSizes();

  final double size12 = 12;
  final double size13 = 13;
  final double size15 = 15;
  final double size18 = 18;
  final double size20 = 18;
  final double size25 = 25;
}

class _FontNames {
  const _FontNames();

  final String euclid = 'EuclidCircularA';
  final String montserrat = 'Montserrat';
}

abstract class AppGradients {
  static RadialGradient blurredWhiteGlassBackground() {
    return const RadialGradient(
      center: Alignment(0.1, 0), // ~54.56% x, 50% y
      radius: 1.65, // ~165.43%
      colors: [
        Color.fromRGBO(255, 255, 255, 0.1),
        Color.fromRGBO(255, 255, 255, 0.03),
      ],
      stops: [0.0, 1.0],
    );
  }

  static RadialGradient tokenGradientBlackRed(BuildContext context) {
    return RadialGradient(
      center: const Alignment(-0.47, -0.7),
      radius: 1.65,
      stops: const [0.0, 1.0],
      colors: [
        context.colorPalette.bottomSheetGradientSecondary,
        context.colorPalette.bottomSheetGradientPrimary,
      ],
    );
  }

  static RadialGradient tokenGradientPurpleRed(BuildContext context) {
    return RadialGradient(
      center: const Alignment(-0.47, -0.7),
      radius: 1.75,
      stops: const [0.0, 1.0],
      colors: [
        context.colorPalette.bottomSheetGradientTertiary,
        context.colorPalette.bottomSheetGradientPrimary,
      ],
    );
  }
}
