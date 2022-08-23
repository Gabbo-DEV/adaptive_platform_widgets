import 'dart:io';

import 'package:flutter/material.dart';

class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget(
      {Key? key, required this.androidWidget, required this.iOSWidget})
      : super(key: key);

  final Widget androidWidget;
  final Widget iOSWidget;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return iOSWidget;
    }
    return androidWidget;
  }
}
