import 'package:flutter/material.dart'
    show Scaffold, Colors, Key, Widget, Color, BuildContext;
import 'package:flutter/cupertino.dart'
    show CupertinoPageScaffold, CupertinoNavigationBar;

import '../adaptive_widget_contract.dart';

// this widget returns either a CupertinoPageScaffold or Scaffold

// there are some common properties, however, is possible to provide

// a `specialScaffold` one to set a custom Scaffold

// a similar thing is not done for iOS because there are few properties for

// the cupertino scaffold.

// the class is open to accept new properties

class AdaptiveScaffold extends PlatformWidget<CupertinoPageScaffold, Scaffold> {
  const AdaptiveScaffold({
    Key? key,
    required this.child,
    this.resizeToAvoidBottomInset,
    this.cupertinoNavigationBar,
    this.backgroundColor,
    this.specialScaffold,
  }) : super(key: key);

  final Widget child;
  final bool? resizeToAvoidBottomInset;
  final CupertinoNavigationBar? cupertinoNavigationBar;
  final Color? backgroundColor;
  final Scaffold? specialScaffold;

  @override
  CupertinoPageScaffold buildCupertinoWidget(BuildContext context) {
    return CupertinoPageScaffold(
      key: key,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      navigationBar: cupertinoNavigationBar,
      backgroundColor: backgroundColor ?? Colors.white,
      child: child,
    );
  }

  @override
  Scaffold buildMaterialWidget(BuildContext context) {
    return Scaffold(
      key: key,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      backgroundColor: backgroundColor,
      body: child,
    );
  }
}
