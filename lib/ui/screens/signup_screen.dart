import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:case_study_movies_project/ui/bloc/auth_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/auth_form_cubit.dart';
import 'package:case_study_movies_project/ui/screens/terms_and_conditions_screen.dart';
import 'package:case_study_movies_project/ui/widgets/button_main.dart';
import 'package:case_study_movies_project/ui/widgets/button_text.dart';
import 'package:case_study_movies_project/ui/widgets/section_social_login.dart';
import 'package:case_study_movies_project/ui/widgets/section_title_subtitle.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/ui/widgets/textfield_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthFormCubit>(
      create: (context) => AuthFormCubit(authBloc: context.read<AuthBloc>()),
      child: BlocBuilder<AuthFormCubit, AuthFormState>(
        builder: (context, state) {
          final cubit = context.read<AuthFormCubit>();

          final validationError = state.nameError ??
              state.emailError ??
              state.passwordError ??
              state.confirmPasswordError;
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
                      title: AppStrings.signUpTitle,
                      subtitle: AppStrings.signUpSubtitle,
                    ),
                    SizedBox(height: AppConstants.spacings.space40),
                    TextFieldCustom(
                      onChanged: cubit.nameChanged,
                      keyboardType: TextInputType.name,
                      hintText: AppStrings.hintFullName,
                      prefixIconPath: AppVisuals.user,
                      prefixIconSize: AppConstants.sizes.iconUserHeight,
                    ),
                    SizedBox(height: AppConstants.spacings.space13),
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
                    SizedBox(height: AppConstants.spacings.space13),
                    TextFieldCustom(
                      onChanged: cubit.confirmPasswordChanged,
                      onToggle: cubit.togglePasswordVisibility,
                      obscureText: !state.isPasswordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: AppStrings.hintConfirmPassword,
                      prefixIconPath: AppVisuals.unlock,
                      prefixIconSize: AppConstants.sizes.iconUnlockHeight,
                      suffixIconPath: AppVisuals.hide,
                      suffixIconSize: AppConstants.sizes.iconHideHeight,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: AppConstants.paddings.screen + 10),
                        child: SizedBox(
                          height: AppConstants.spacings.space20,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: AppConstants.paddings.screen, top: 6),
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
                    SizedBox(height: AppConstants.spacings.space16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ButtonText(
                          leadingText: AppStrings.termsAndConditionsFirst,
                          buttonText: AppStrings.termsAndConditionsSecond,
                          isUnderlinedButton: true,
                          spacing: AppConstants.spacings.space4,
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              enableDrag: true,
                              showDragHandle: false,
                              isScrollControlled: true,
                              clipBehavior: Clip.antiAlias,
                              backgroundColor:
                                  context.colorPalette.bottomSheetBackground,
                              barrierColor: Colors.black.withAlpha(191),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          AppConstants.radius.bottomSheet))),
                              builder: (context) => const FractionallySizedBox(
                                heightFactor: 0.75,
                                widthFactor: 1,
                                child: TermsAndConditionsScreen(),
                              ),
                            );
                          },
                        ),
                        TextCustom(
                          text: AppStrings.termsAndConditionsThird,
                          color: context.colorPalette.textFaded05,
                          textStyle: context.textTheme.infoLight,
                          textAlignCustom: TextAlign.center,
                        ),
                      ],
                    ).animate(delay: 700.ms).fadeIn(duration: 400.ms),
                    SizedBox(height: AppConstants.spacings.space37),
                    ButtonMain(
                      loading: state.isSubmitting,
                      text: AppStrings.signUpButton,
                      onPressed: () =>
                          cubit.signUp(state.isValid, state.isSubmitting),
                    ).animate(delay: 800.ms).fadeIn(duration: 600.ms),
                    SizedBox(height: AppConstants.spacings.space37),
                    const SectionSocialLogin()
                        .animate(delay: 900.ms)
                        .fadeIn(duration: 1000.ms),
                    SizedBox(height: AppConstants.spacings.space32),
                    ButtonText(
                      leadingText: AppStrings.alreadyHaveAnAccount,
                      buttonText: AppStrings.alreadyHaveAnAccountButton,
                      onPressed: () => context.pushReplacement(Routes.signIn),
                    ).animate(delay: 1000.ms).fadeIn(duration: 600.ms),
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
