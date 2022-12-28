import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class PlatformWidget<C extends Widget, M extends Widget>
    extends StatelessWidget {
  const PlatformWidget({Key? key}) : super(key: key);

  C buildCupertinoWidget(BuildContext context);
  M buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? buildCupertinoWidget(context)
        : buildMaterialWidget(context);
  }
}
