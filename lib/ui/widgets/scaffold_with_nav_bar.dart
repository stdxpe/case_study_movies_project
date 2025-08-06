import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:collection/collection.dart'; // for mapIndexed
import 'package:go_router/go_router.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonNavigationBarItem(
              text: AppStrings.homeButton,
              iconPath: AppVisuals.home,
              onPressed: () {
                if (navigationShell.currentIndex != 0) {
                  navigationShell.goBranch(0);
                }
              },
              isSelected: navigationShell.currentIndex == 0,
            ),
            SizedBox(width: AppConstants.spacings.space16),
            ButtonNavigationBarItem(
              text: AppStrings.profileButton,
              iconPath: AppVisuals.profile,
              onPressed: () {
                if (navigationShell.currentIndex != 1) {
                  navigationShell.goBranch(1);
                }
              },
              isSelected: navigationShell.currentIndex == 1,
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
