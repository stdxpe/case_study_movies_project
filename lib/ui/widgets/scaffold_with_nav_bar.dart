import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';

import 'package:case_study_movies_project/ui/widgets/button_navigation_bar.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';
// ignore_for_file: depend_on_referenced_packages

class ScaffoldWithBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  const ScaffoldWithBottomNavBar(
      {super.key, required this.navigationShell, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSwipeAnimationOnNavBar(
        currentIndex: navigationShell.currentIndex,
        children: children,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: AppConstants.paddings.navButtonHorizontal,
          right: AppConstants.paddings.navButtonHorizontal,
          bottom: AppConstants.paddings.size20,
          top: AppConstants.spacings.space12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonNavigationBarItem(
              text: AppStrings.homeButton,
              iconPath: AppVisuals.home,
              isSelected: navigationShell.currentIndex == 0,
              onPressed: () {
                if (navigationShell.currentIndex != 0) {
                  navigationShell.goBranch(0);
                }
              },
            ),
            SizedBox(width: AppConstants.spacings.space16),
            ButtonNavigationBarItem(
              text: AppStrings.profileButton,
              iconPath: AppVisuals.profile,
              isSelected: navigationShell.currentIndex == 1,
              onPressed: () {
                if (navigationShell.currentIndex != 1) {
                  navigationShell.goBranch(1);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Screen Transition Animation Builder | NavBarSwipeTransition
class CustomSwipeAnimationOnNavBar extends StatelessWidget {
  final int currentIndex;
  final List<Widget> children;

  const CustomSwipeAnimationOnNavBar(
      {super.key, required this.currentIndex, required this.children});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children.mapIndexed(
        (index, navigator) {
          return AnimatedSlide(
            offset: currentIndex == index
                ? Offset.zero
                : index > currentIndex
                    ? const Offset(1, 0)
                    : const Offset(-1, 0),
            duration: 200.ms,
            curve: Curves.easeInOut,
            child: _branchNavigatorWrapper(index, navigator),
          );
        },
      ).toList(),
    );
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
        ignoring: index != currentIndex,
        child: TickerMode(
          enabled: index == currentIndex,
          child: navigator,
        ),
      );
}
