import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTheme {
  final ThemeData? materialTheme;
  final CupertinoThemeData? cupertinoTheme;

  const AdaptiveTheme._({this.materialTheme, this.cupertinoTheme});

  factory AdaptiveTheme.of(BuildContext context) {
    if (!Platform.isIOS) {
      return AdaptiveTheme._(
          materialTheme: Theme.of(context), cupertinoTheme: null);
    }

    return AdaptiveTheme._(
        materialTheme: null, cupertinoTheme: CupertinoTheme.of(context));
  }

  Color get primaryColor => materialTheme != null
      ? materialTheme!.colorScheme.primary
      : cupertinoTheme!.primaryColor;

  Color get secondaryColor => materialTheme != null
      ? materialTheme!.colorScheme.secondary
      : cupertinoTheme!.primaryContrastingColor;
}
