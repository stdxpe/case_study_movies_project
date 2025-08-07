import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:case_study_movies_project/ui/widgets/button_main.dart';
import 'package:case_study_movies_project/ui/widgets/button_text.dart';
import 'package:case_study_movies_project/ui/widgets/section_social_login.dart';
import 'package:case_study_movies_project/ui/widgets/section_title_subtitle.dart';
import 'package:case_study_movies_project/ui/widgets/textfield_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorPalette.scaffoldBackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: context.mediaQuery.size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SectionTitleSubtitle(
                title: AppStrings.signInTitle,
                subtitle: AppStrings.signInSubtitle,
              ),
              SizedBox(height: AppConstants.spacings.space40),
              TextFieldCustom(
                hintText: AppStrings.hintEmail,
                prefixIconPath: AppVisuals.mail,
                prefixIconSize: AppConstants.sizes.iconMailHeight,
              ),
              SizedBox(height: AppConstants.spacings.space13),
              TextFieldCustom(
                hintText: AppStrings.hintPassword,
                prefixIconPath: AppVisuals.unlock,
                prefixIconSize: AppConstants.sizes.iconUnlockHeight,
                suffixIconPath: AppVisuals.hide,
                suffixIconSize: AppConstants.sizes.iconHideHeight,
              ),
              SizedBox(height: AppConstants.spacings.space30),
              Row(
                children: [
                  ButtonText(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.paddings.screen),
                    buttonText: AppStrings.forgotPassword,
                    isUnderlinedButton: true,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: AppConstants.spacings.space24),
              ButtonMain(
                text: AppStrings.signInButton,
                onPressed: () => context.push(Routes.home),
              ),
              SizedBox(height: AppConstants.spacings.space37),
              const SectionSocialLogin(),
              SizedBox(height: AppConstants.spacings.space32),
              ButtonText(
                leadingText: AppStrings.dontHaveAnAccount,
                buttonText: AppStrings.dontHaveAnAccountButton,
                onPressed: () {},
              ),
              SizedBox(height: AppConstants.paddings.screen),
            ],
          ),
        ),
      ),
    );
  }
}
