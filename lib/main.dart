import 'package:flutter/material.dart';

import 'package:case_study_movies_project/services/global_services.dart/dependency_injection_service.dart';
import 'package:case_study_movies_project/ui/screens/0test_screen.dart';
import 'package:case_study_movies_project/ui/screens/main_screen_with_navbar.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencyInjectionService();
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.dark,

      debugShowCheckedModeBanner: false,
      // home: const HomeWithCustomNavButtons(),
      home: TestScreen(),
    );
  }
}
