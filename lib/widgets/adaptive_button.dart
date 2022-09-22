import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// this widget returns either a CupertinoButton or Elevated button

// there are some common properties, however, is possible to provide

// a `specialMaterialStyle` to set a custom style to the ElevatedButton

// a similar thing is not done for iOS because there are few properties for

// the button.

// the class is open to accept new properties

class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({
    Key? key,
    this.specialMaterialStyle,
    this.onPressed,
    required this.child,
    this.padding,
    this.size,
    this.borderRadius,
    this.primaryColor,
    this.minimumSize,
    this.elevation,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Size? size;
  final Size? minimumSize;
  final BorderRadius? borderRadius;
  final Color? primaryColor;
  final double? elevation;

  final ButtonStyle? specialMaterialStyle;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        padding: padding,
        borderRadius: borderRadius,
        color: primaryColor,
        child: child,
      );
    } else {
      if (specialMaterialStyle != null) {
        return ElevatedButton(
          onPressed: onPressed,
          style: specialMaterialStyle, // custom style
          child: child,
        );
      } else {
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: elevation,
            padding: padding,
            fixedSize: size,
            minimumSize: minimumSize,
            primary: primaryColor,
          ),
          child: child,
        );
      }
    }
  }
}
