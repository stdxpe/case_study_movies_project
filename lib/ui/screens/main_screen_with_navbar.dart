import 'package:flutter/material.dart';

import 'package:case_study_movies_project/ui/screens/discover_screen.dart';
import 'package:case_study_movies_project/ui/screens/profile_details_screen.dart';
import 'package:case_study_movies_project/ui/widgets/button_navigation_bar.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class HomeWithCustomNavButtons extends StatefulWidget {
  const HomeWithCustomNavButtons({super.key});

  @override
  State<HomeWithCustomNavButtons> createState() =>
      _HomeWithCustomNavButtonsState();
}

class _HomeWithCustomNavButtonsState extends State<HomeWithCustomNavButtons> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [DiscoverScreen(), ProfileDetailsScreen()];

  void _onNavButtonPressed(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonNavigationBarItem(
              text: AppStrings.homeButton,
              iconPath: AppVisuals.home,
              onPressed: () => _onNavButtonPressed(0),
            ),
            SizedBox(width: AppConstants.spacings.space16),
            ButtonNavigationBarItem(
              text: AppStrings.profileButton,
              iconPath: AppVisuals.profile,
              onPressed: () => _onNavButtonPressed(1),
            ),
          ],
        ),
      ),
    );
  }
}
