<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Flutter package to automatically build widgets according to the platform. Only Android & iOS. 
## Features



## Getting started

Add adaptive dependency:
dependencies:
  adaptive: 0.0.1


## Usage
Adaptive App
With this widget you can easly set up the root of your application.
It accepts different parameters, common to both platform Android and iOS; also, the user can customize more the theme of the App by passing a ThemeData (used for Android theme) and a CupertinoThemeData (used for iOS).
```dart
class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
        return AdaptiveApp(
            showDebugBanner: false,
            cupertinoApp: AppVars.cupertinoTheme(),
            materialApp: AppVars.materialTheme(),
            title: AppVars.appName,
            initialRoute: AppRouter.splashPage,
            onGenerateRoute: AppRouter.onGenerateRoute,
            supportedLocales: AppTranslations.supportedLocales,
            localizationsDelegates: AppTranslations.localizationsDelegates,
        ),
    }
}
```

Adaptive Button 
Similar to the one above, this widget reders an ElevatedButton when the platform is Android, or a CupertinoButton when it's iOS.
The widget acceps different parameters:
- onPressed
-  child
-  padding
-  size
-  minimumSize
-  borderRadius
-  primaryColor
-  elevation
-  specialMaterialStyle

Also, if you pass a ButtonStyle to 'specialMaterialStyle', the Material version of the button will apply the given style.

```dart
AdaptiveButton(
    onPressed: () {
        // on pressed event
    },
    size: const Size(160, 50),
    primaryColor: Colors.red,
    child: Text(
    'I\'m bi-platform!',
    style: const TextStyle(fontSize: 20, color: Colors.black),
),
```
Adaptive Scaffold
Same thing here. 
This widget accepts these parameters:
- child
- resizeToAvoidBottomInset
- cupertinoNavigationBar
- backgroundColor
- specialScaffold

If you pass a Scaffold widget to 'specialScaffold', it will be rendered for Android. 

```dart
@override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      child: SafeArea(
        child: Column(
          children: [
            const Text('Awsome'),
          ],
        ),
      ),
    );
  }

```

## Additional information

For now this package contains few widget, but i'll add other stuff as the time goes by. 

