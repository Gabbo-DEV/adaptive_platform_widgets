import 'package:adaptive_platform_widgets/adaptive_widget_contract.dart';
import 'package:flutter/material.dart';

class AdaptiveWidget extends PlatformWidget<Widget, Widget> {
  const AdaptiveWidget(
      {Key? key, required this.materialWidget, required this.iOSWidget})
      : super(key: key);

  final Widget materialWidget;
  final Widget iOSWidget;

  @override
  Widget buildCupertinoWidget(BuildContext context) => iOSWidget;

  @override
  Widget buildMaterialWidget(BuildContext context) => materialWidget;
}
