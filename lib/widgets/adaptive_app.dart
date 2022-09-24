import 'package:adaptive_platform_widgets/adaptive_widget_contract.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveApp extends PlatformWidget<CupertinoApp, MaterialApp> {
  const AdaptiveApp({
    Key? key,
    this.materialTheme,
    this.cupertinoTheme,
    required this.showDebugBanner,
    required this.title,
    required this.localizationsDelegates,
    required this.supportedLocales,
    required this.initialRoute,
    required this.onGenerateRoute,
  }) : super(key: key);

  final ThemeData? materialTheme;
  final CupertinoThemeData? cupertinoTheme;

  final bool showDebugBanner;
  final String title;
  final List<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final List<Locale> supportedLocales;
  final String initialRoute;
  final RouteFactory onGenerateRoute;

  @override
  CupertinoApp buildCupertinoWidget(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: showDebugBanner,
      theme: cupertinoTheme,
      title: title,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }

  @override
  MaterialApp buildMaterialWidget(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: showDebugBanner,
      theme: materialTheme,
      title: title,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
