import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_calculator_pro/core/theme/app_theme.dart';
import 'package:ai_calculator_pro/core/theme/app_colors.dart';
import 'package:ai_calculator_pro/core/theme/theme_provider.dart';
import 'package:ai_calculator_pro/features/main/presentation/main_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeProvider);
    final primaryColor = AppColors.themeColors[themeSettings.primaryColorIndex];

    return MaterialApp(
      title: 'AI Calculator Pro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(primaryColor),
      darkTheme: AppTheme.darkTheme(primaryColor),
      themeMode: themeSettings.themeMode,
      home: const MainScreen(),
    );
  }
}
