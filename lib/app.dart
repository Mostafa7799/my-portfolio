import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';
import 'ui/portfolio_page.dart';
import 'state/app_settings_controller.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key, required this.controller});

  final AppSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mostafa Portfolio',
          locale: controller.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) {
            final isArabic = controller.locale.languageCode == 'ar';
            return Directionality(
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              child: child ?? const SizedBox.shrink(),
            );
          },
          themeMode: controller.themeMode,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF0E7490),
              primary: const Color(0xFF0E7490),
            ),
            scaffoldBackgroundColor: const Color(0xFFF8FAFC),
            textTheme: const TextTheme(
              displaySmall: TextStyle(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
                height: 1.15,
              ),
              headlineMedium: TextStyle(
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
              headlineSmall: TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
              ),
              titleLarge: TextStyle(fontWeight: FontWeight.w600),
              bodyLarge: TextStyle(height: 1.7),
              bodyMedium: TextStyle(height: 1.65),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: const Color(0xFF06B6D4),
              primary: const Color(0xFF22D3EE),
            ),
            textTheme: const TextTheme(
              displaySmall: TextStyle(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
                height: 1.15,
              ),
              headlineMedium: TextStyle(
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
              headlineSmall: TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
              ),
              titleLarge: TextStyle(fontWeight: FontWeight.w600),
              bodyLarge: TextStyle(height: 1.7),
              bodyMedium: TextStyle(height: 1.65),
            ),
          ),
          home: PortfolioPage(controller: controller),
        );
      },
    );
  }
}
