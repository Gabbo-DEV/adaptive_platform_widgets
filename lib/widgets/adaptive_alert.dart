import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveAlert {
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

  static Future<bool?> error({
    required BuildContext context,
    required Widget title,
    required String content,
  }) {
    if (!Platform.isIOS) {
      return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: title,
          content: _errorContent(context, content),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }

    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: title,
        content: _errorContent(context, content),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Ok', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  static Widget _errorContent(BuildContext context, String content) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .04,
          ),
          padding: const EdgeInsets.only(
            top: 32,
            left: 16,
            right: 16,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(content),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Ok'),
                  ),
                ],
              ),
              Positioned(
                  top: -28,
                  child: CircleAvatar(
                    minRadius: 16,
                    maxRadius: 28,
                    backgroundColor: Theme.of(context).colorScheme.error,
                    child: const Icon(
                      Icons.assistant_photo,
                      size: 28,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
