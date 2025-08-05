part of 'utilities_library_imports.dart';

/// CUSTOM TEXTSTYLE IMPLEMENTATIONS TO THEMES
abstract class AppTextThemes {
  static final TextTheme textTheme = const TextTheme().copyWith(
    //
    // title - 18px, 600 - Used in screen headers: "Welcome", "Upload Photos", "Movie Title"
    headlineMedium: TextStyle(
      fontFamily: AppConstants.fontNames.euclid,
      fontSize: AppConstants.fontSizes.size18,
      fontWeight: FontWeight.w600,
      height: 1.0,
    ),

    // subtitle - 13px, 400 - Used in body descriptions: "Tempus varius...", card texts
    bodyMedium: TextStyle(
      fontFamily: AppConstants.fontNames.euclid,
      fontSize: AppConstants.fontSizes.size13,
      fontWeight: FontWeight.w400,
      height: 1.0,
    ),

    // infoLight - 12px, 400 - Used in hintTexts, footers, ID subtexts
    labelSmall: TextStyle(
      fontFamily: AppConstants.fontNames.euclid,
      fontSize: AppConstants.fontSizes.size12,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),

    // infoBold - 13px, 700 - Used in: "Add Photo", "Favorite Movies", "See More"
    labelLarge: TextStyle(
      fontFamily: AppConstants.fontNames.euclid,
      fontSize: AppConstants.fontSizes.size13,
      fontWeight: FontWeight.w700,
      height: 1.0,
    ),

    // action - 15px, 500 - Used in buttons: "Sign In", "View All Tokens", AppBar titles
    titleMedium: TextStyle(
      fontFamily: AppConstants.fontNames.euclid,
      fontSize: AppConstants.fontSizes.size15,
      fontWeight: FontWeight.w500,
      height: 1.0,
    ),

    // tokenMontserrat - 25px, 900 - Used in token display: "300", "3375" in token cards
    displayLarge: TextStyle(
      fontFamily: AppConstants.fontNames.montserrat,
      fontSize: AppConstants.fontSizes.size25,
      fontWeight: FontWeight.w900,
      height: 1.0,
    ),
  );
}
