import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// this widget returns either a CupertinoPageScaffold or Scaffold

// there are some common properties, however, is possible to provide

// a `specialScaffold` one to set a custom Scaffold

// a similar thing is not done for iOS because there are few properties for

// the cupertino scaffold.

// the class is open to accept new properties

class AdaptiveScaffold extends StatelessWidget {
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
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      return CupertinoPageScaffold(
        key: key,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
        navigationBar: cupertinoNavigationBar,
        backgroundColor: backgroundColor ?? Colors.white,
        child: child,
      );
    } else {
      if (specialScaffold != null) {
        return specialScaffold!;
      } else {
        return Scaffold(
          key: key,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
          backgroundColor: backgroundColor,
          body: child,
        );
      }
    }
  }
}
