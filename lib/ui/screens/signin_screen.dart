import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:case_study_movies_project/ui/bloc/auth_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/auth_form_cubit.dart';
import 'package:case_study_movies_project/ui/widgets/button_main.dart';
import 'package:case_study_movies_project/ui/widgets/button_text.dart';
import 'package:case_study_movies_project/ui/widgets/section_social_login.dart';
import 'package:case_study_movies_project/ui/widgets/section_title_subtitle.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/ui/widgets/textfield_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthFormCubit>(
      create: (context) => AuthFormCubit(authBloc: context.read<AuthBloc>()),
      child: BlocBuilder<AuthFormCubit, AuthFormState>(
        builder: (context, state) {
          final cubit = context.read<AuthFormCubit>();
          final validationError = state.emailError ?? state.passwordError;
          final errorMessage = state.generalError ?? validationError;

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
                      obscureText: !state.isPasswordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: AppStrings.hintPassword,
                      prefixIconPath: AppVisuals.unlock,
                      prefixIconSize: AppConstants.sizes.iconUnlockHeight,
                      suffixIconPath: AppVisuals.hide,
                      suffixIconSize: AppConstants.sizes.iconHideHeight,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: AppConstants.paddings.screen + 10,
                        ),
                        child: SizedBox(
                          height: AppConstants.spacings.space20,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: AppConstants.paddings.screen,
                              top: 6,
                            ),
                            child: TextCustom(
                              text: errorMessage ?? '',
                              textStyle: context.textTheme.infoLight,
                              color: context.colorPalette.error,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ButtonText(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.paddings.screen,
                          ),
                          buttonText: AppStrings.forgotPassword,
                          isUnderlinedButton: true,
                          onPressed: () {},
                        ).animate(delay: 800.ms).fadeIn(duration: 400.ms),
                      ],
                    ),
                    SizedBox(height: AppConstants.spacings.space24),
                    ButtonMain(
                      loading: state.isSubmitting,
                      text: AppStrings.signInButton,
                      onPressed: () =>
                          cubit.signIn(state.isValid, state.isSubmitting),
                    ).animate(delay: 900.ms).fadeIn(duration: 500.ms),
                    SizedBox(height: AppConstants.spacings.space37),
                    const SectionSocialLogin()
                        .animate(delay: 900.ms)
                        .fadeIn(duration: 1000.ms),
                    SizedBox(height: AppConstants.spacings.space32),
                    ButtonText(
                      leadingText: AppStrings.dontHaveAnAccount,
                      buttonText: AppStrings.dontHaveAnAccountButton,
                      onPressed: () => context.pushReplacement(Routes.signUp),
                    ).animate(delay: 900.ms).fadeIn(duration: 1000.ms),
                    SizedBox(height: AppConstants.paddings.screen),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
