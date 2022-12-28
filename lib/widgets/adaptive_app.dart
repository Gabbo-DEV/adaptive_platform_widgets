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
    this.onGenerateRoute,
    this.navigatorObservers,
    this.navigatorKey,
    this.routes,
  }) : super(key: key);

  final ThemeData? materialTheme;
  final CupertinoThemeData? cupertinoTheme;

  final bool showDebugBanner;
  final String title;
  final List<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final List<Locale> supportedLocales;
  final String initialRoute;
  final RouteFactory? onGenerateRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Map<String, WidgetBuilder>? routes;

  @override
  CupertinoApp buildCupertinoWidget(BuildContext context) {
    return CupertinoApp(
      theme: cupertinoTheme,
      debugShowCheckedModeBanner: showDebugBanner,
      title: title,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      navigatorObservers: (navigatorObservers ?? const <NavigatorObserver>[]),
      navigatorKey: navigatorKey,
      routes: (routes ?? const <String, WidgetBuilder>{})
    );
  }

  @override
  MaterialApp buildMaterialWidget(BuildContext context) {
    return MaterialApp(
      theme: materialTheme,
      debugShowCheckedModeBanner: showDebugBanner,
      title: title,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      navigatorObservers: (navigatorObservers ?? const <NavigatorObserver>[]),
      navigatorKey: navigatorKey,
      routes: (routes ?? const <String, WidgetBuilder>{}),
    );
  }
}
