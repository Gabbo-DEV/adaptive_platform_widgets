import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveAlert {
  const AdaptiveAlert._();

  static Future<bool?> twoButtons({
    required BuildContext context,
    required Widget title,
    VoidCallback? onNoPressed,
    VoidCallback? onYesPressed,
    String? yesText,
  }) {
    if (!Platform.isIOS) {
      return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: title,
          actions: <Widget>[
            ElevatedButton(
              onPressed: onNoPressed,
              child: const Text('No', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: onYesPressed,
              child: Text(yesText ?? 'Yes'),
            ),
          ],
        ),
      );
    }
    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: title,
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: onNoPressed,
            child: const Text('No', style: TextStyle(color: Colors.white)),
          ),
          CupertinoDialogAction(
            onPressed: onYesPressed,
            child: Text(
              yesText ?? 'Yes',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> error(BuildContext context,
      {Widget title = const Text('Error'),
      Widget content = const Text(''),
      required VoidCallback onPressed}) {
    if (!Platform.isIOS) {
      return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: title,
          actions: <Widget>[
            TextButton(
              onPressed: onPressed,
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: title,
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: onPressed,
            child: const Text(
              'Ok',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
