part of 'utilities_library_imports.dart';

/// [APP WIDE GLOBAL VARIABLE]
/// ALL STATIC STRINGS - EN
abstract class AppStrings {
  static const String appTitle = "SinFlix";

  static const String homeButton = "Home";
  static const String profileButton = "Profile";
  static const String signInTitle = "Welcome";
  static const String signInSubtitle =
      "Let's get you started.\nPlease sign in to continue.";
  static const String signUpButton = "Sign Up";
  static const String signUpTitle = "Welcome";
  static const String signUpSubtitle =
      "A new story begins here.\nCreate your account to join the cast.";
  static const String signInButton = "Sign In";
  static const String dontHaveAnAccount = "Don't have an account?";
  static const String dontHaveAnAccountButton = "Sign up!";
  static const String alreadyHaveAnAccount = "Already have an account?";
  static const String alreadyHaveAnAccountButton = "Sign in!";
  static const String forgotPassword = "Forgot password?";

  static const hintEmail = 'Email';
  static const hintPassword = 'Password';
  static const hintConfirmPassword = 'Confirm Password';
  static const hintFullName = 'Full Name';

  static const String textEllipsisDots = "...  ";
  static const String seeMore = "See More";
  static const String hide = "Hide";

  static const String termsAndConditions =
      "I confirm that I have carefully read and agree to the Privacy Policy and Terms and Conditions.";
  static const String termsAndConditionsFirst =
      "I confirm that I have carefully";
  static const String termsAndConditionsSecond = "read and agree";
  static const String termsAndConditionsThird =
      "to the Privacy Policy and Terms and Conditions.";
  static const String profileDetails = "Profile";
  static const String addPhotoButton = "Add Photo";
  static const String uploadPhotosTitle = "Upload Photos";
  static const String uploadPhotosSubtitle =
      "Choose your photos that\nhighlight your best moments.";
  static const String continueButton = "Continue";
  static const String moreButton = "More";
  static const String favoriteMovies = "Favorite Movies";
  static const String limitedOffer = "Limited Offer";
  static const String limitedOfferSubtitle =
      // "Unlock new features and extra bonus rewards by picking your premium token pack!";
      // "Unlock new features and exclusive\npremium mode by picking your token pack!";
      "Unlock exclusive premium mode and\nnew features and by picking your token pack!";
  static const String bonus = "Bonus Rewards";
  static const String premium = "Premium\nAccount";
  static const String moreMatches = "More\nMatches";
  static const String boostProfile = "Boost\nProfile";
  static const String moreLikes = "More\nLikes";
  static const String tokenPackTitle = "Select a token pack to unlock";
  static const String tokenButton = "View All Tokens";
  static const String token = "Token";
  static const String perWeek = "Per Week";

  //TODO: HERE: PICK BETTER!

  // Let’s get you started. Please sign in to continue.
// Create your account and unlock a brand new chapter.
// This could be the beginning of something great.
// The scene is set. All we need is you.
// Your favorite kind of story begins here.
// We’ve saved your seat. Log in to join.
// Your story continues here. Sign in to proceed.
// Join us and start your cinematic journey today.
// New adventures await. Let’s get you on board.

  static _ErrorStrings get errors => _ErrorStrings();
}

class _ErrorStrings {
  final String invalidCredentials400 = 'Invalid credentials';
  final String invalidInput = 'Invalid input or email already exists';
  final String uploadPhotoInvalidFormat = 'Invalid file format';
  final String unauthorized401 = 'Unauthorized';
  final String movieNotFound404 = 'Movie not found';
  final String unknown = 'Unknown error occurred';
  final String loginFailedWithCode = 'Login failed with status code: ';
  final String registerFailedWithCode = 'Register failed with status code: ';
  final String profileFail = 'Failed to load profile';
  final String uploadPhotoFail = 'Failed to upload photo';
}
