import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../adaptive_widget_contract.dart';

// this widget returns either a CupertinoButton or Elevated button

// there are some common properties, however, is possible to provide

// a `specialMaterialStyle` to set a custom style to the ElevatedButton

// a similar thing is not done for iOS because there are few properties for

// the button.

// the class is open to accept new properties

class AdaptiveButton extends PlatformWidget<Widget, ElevatedButton> {
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
    this.materialShape,
    this.isCircular = false,
  }) : super(key: key);

  factory AdaptiveButton.icon({
    required Icon icon,
    void Function()? onPressed,
    Size? size,
    Color? backgroundColor,
    double? elevation,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(30)),
  }) {
    return AdaptiveButton(
      onPressed: onPressed,
      materialShape: const CircleBorder(),
      size: size,
      padding: EdgeInsets.zero,
      isCircular: true,
      primaryColor: backgroundColor,
      borderRadius: borderRadius,
      elevation: elevation,
      child: icon,
    );
  }

  final VoidCallback? onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Size? size;
  final Size? minimumSize;
  final BorderRadius? borderRadius;
  final Color? primaryColor;
  final double? elevation;
  final OutlinedBorder? materialShape;
  final ButtonStyle? specialMaterialStyle;
  final bool isCircular;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    final btn = CupertinoButton(
      onPressed: onPressed,
      padding: padding,
      borderRadius: borderRadius,
      minSize: minimumSize != null ? minimumSize!.height : null,
      color: primaryColor,
      child: child,
    );
    if (isCircular) {
      return SizedBox(
        height: size != null ? size!.height : 50,
        width: size != null ? size!.width : 50,
        child: btn,
      );
    }
    return btn;
  }

  @override
  ElevatedButton buildMaterialWidget(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shape: materialShape,
        padding: padding,
        fixedSize: size,
        minimumSize: minimumSize,
        primary: primaryColor,
      ),
      child: child,
    );
  }
}
