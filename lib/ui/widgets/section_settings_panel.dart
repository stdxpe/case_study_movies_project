import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:case_study_movies_project/ui/bloc/auth_bloc.dart';
import 'package:case_study_movies_project/ui/bloc/auth_event.dart';
import 'package:case_study_movies_project/ui/bloc/theme_cubit.dart';
import 'package:case_study_movies_project/ui/widgets/button_profile.dart';
import 'package:case_study_movies_project/ui/widgets/switch_cupertino_custom.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class SectionSettingsPanel extends StatefulWidget {
  const SectionSettingsPanel({super.key});

  @override
  State<SectionSettingsPanel> createState() => _SectionSettingsPanelState();
}

class _SectionSettingsPanelState extends State<SectionSettingsPanel> {
  bool _showPanel = false;
  @override
  Widget build(BuildContext context) {
    const double iconButtonSize = 50;
    const double panelHeight = 40;
    final double maxWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: panelHeight,
      width: maxWidth,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: panelHeight,
            width: maxWidth,
            color: Colors.transparent,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedOpacity(
                  opacity: _showPanel ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: IgnorePointer(
                    ignoring: !_showPanel,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SwitchCupertinoCustom(
                          switchState: context.watch<ThemeCubit>().state ==
                              ThemeMode.dark,
                          onChanged: (val) =>
                              context.read<ThemeCubit>().toggleTheme(),
                        ),
                        SizedBox(width: AppConstants.spacings.space8),
                        ButtonProfile(
                          text: 'TR',
                          radius: AppConstants.radius.addPhotoButton,
                          fontSize: AppConstants.fontSizes.size13,
                          backgroundColor: context.colorPalette.text,
                          foregroundColor:
                              context.colorPalette.scaffoldBackground,
                          paddingHorizontal: 0,
                          paddingVertical:
                              AppConstants.paddings.addPhotoVertical,
                          onPressed: () {
                            context.setLocale(const Locale('tr'));
                          },
                        ),
                        SizedBox(width: AppConstants.spacings.space8),
                        ButtonProfile(
                          text: 'EN',
                          radius: AppConstants.radius.addPhotoButton,
                          fontSize: AppConstants.fontSizes.size13,
                          backgroundColor: context.colorPalette.text,
                          foregroundColor:
                              context.colorPalette.scaffoldBackground,
                          paddingHorizontal: 0,
                          paddingVertical:
                              AppConstants.paddings.addPhotoVertical,
                          onPressed: () {
                            context.setLocale(const Locale('en'));
                          },
                        ),
                        SizedBox(width: AppConstants.spacings.space8),
                        ButtonProfile(
                          text: AppStrings.signOutButton,
                          radius: AppConstants.radius.addPhotoButton,
                          fontSize: AppConstants.fontSizes.size13,
                          paddingHorizontal:
                              AppConstants.paddings.addPhotoHorizontal,
                          paddingVertical:
                              AppConstants.paddings.addPhotoVertical,
                          onPressed: () {
                            context.read<AuthBloc>().add(SignOutEvent());
                            context
                                .read<AuthBloc>()
                                .add(CheckAuthStatusEvent());
                            context.go(Routes.splash);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: iconButtonSize,
                  width: iconButtonSize,
                  child: IconButton(
                    icon:
                        Icon(Icons.settings, color: context.colorPalette.text),
                    onPressed: () => setState(() => _showPanel = !_showPanel),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
