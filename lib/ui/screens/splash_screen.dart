import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:case_study_movies_project/ui/bloc/auth_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/auth_event.dart';
import 'package:case_study_movies_project/ui/bloc/auth_state.dart';
import 'package:case_study_movies_project/ui/widgets/text_custom.dart';
import 'package:case_study_movies_project/ui/widgets/lottie_splash_animation.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';
import 'package:case_study_movies_project/services/abstract_classes/i_logger_service.dart';
import 'package:case_study_movies_project/services/global_services/dependency_injection_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.message});
  final String? message;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorPalette.scaffoldBackground,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LottieSplashAnimation(),
            if (widget.message != null) ...[
              SizedBox(height: AppConstants.spacings.space30),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.paddings.screen,
                ),
                child: TextCustom(
                  text: widget.message!,
                  color: context.theme.colorPalette.error,
                  textStyle: context.textTheme.infoLight,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    final authBloc = locator<AuthBloc>();
    final logger = locator<ILoggerService>();

    authBloc.add(CheckAuthStatusEvent());
    _waitMinimumThenRedirect(authBloc, logger);
  }

  Future<void> _waitMinimumThenRedirect(
      AuthBloc authBloc, ILoggerService logger) async {
    await Future.delayed(const Duration(milliseconds: 2500));

    var currentState = authBloc.state;
    if (currentState is AuthLoading) {
      currentState =
          await _waitForAuthState(authBloc, const Duration(seconds: 6), logger);
    }
    if (!mounted) return;
    _redirectBasedOnAuthState(currentState);
  }

  Future<AuthState> _waitForAuthState(
      AuthBloc authBloc, Duration timeout, ILoggerService logger) async {
    try {
      return await authBloc.stream
          .firstWhere((state) => state is! AuthLoading)
          .timeout(timeout, onTimeout: () {
        logger.logInfo('Auth state timeout, fallback to last known state.');
        return authBloc.state;
      });
    } catch (e, stack) {
      logger.logError('Error waiting auth state:',
          error: e as Exception?, stack: stack);
      return authBloc.state;
    }
  }

  void _redirectBasedOnAuthState(AuthState state) {
    if (state is AuthSuccess) {
      context.go(Routes.home);
    } else {
      context.go(Routes.signIn);
    }
  }
}
