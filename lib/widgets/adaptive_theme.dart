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
          materialTheme: null, cupertinoTheme: CupertinoTheme.of(context));
    }

    return AdaptiveTheme._(
        materialTheme: Theme.of(context), cupertinoTheme: null);
  }

  Color get primaryColor => materialTheme != null
      ? materialTheme!.colorScheme.primary
      : cupertinoTheme!.primaryColor;

  Color get secondaryColor => materialTheme != null
      ? materialTheme!.colorScheme.secondary
      : cupertinoTheme!.primaryContrastingColor;

  Color get tertiaryColor => materialTheme != null
      ? materialTheme!.colorScheme.tertiary
      : const Color(0xffF97C2C); // iOS doesn't have tertiary color property

  Color get hintColor => materialTheme != null
      ? materialTheme!.hintColor
      : Colors.grey; // iOS doesn't have tertiary color property

  Color get errorColor => materialTheme != null
      ? materialTheme!.colorScheme.error
      : Colors.red; // iOS doesn't have tertiary color property

  Color get dialogBackgroundColor => materialTheme != null
      ? materialTheme!.dialogBackgroundColor
      : const Color.fromARGB(
          255, 244, 244, 244); // iOS doesn't have tertiary color property
}

//! REMEMBER TO CHANGE THE HARD CODED COLOR FOR iOS IN CASE OF CHANGES 
