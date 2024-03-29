import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveAlert {
  const AdaptiveAlert._();

  static Future<DateTime?> datePicker({
    required BuildContext context,
    required DateTime maximumDate,
    required DateTime minimumDate,
    DateTime? initialDate,
    required String doneText,
  }) async {
    if (Platform.isIOS) {
      DateTime? pickedDate;
      await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            actions: [
              SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  onDateTimeChanged: (value) => pickedDate = value,
                  mode: CupertinoDatePickerMode.date,
                  maximumDate: maximumDate,
                  initialDateTime: initialDate,
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text(doneText),
              onPressed: () => Navigator.pop(context),
            ),
          );
        },
      );

      return pickedDate;
    }

    return await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Theme.of(context).colorScheme.primary,
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          child: child!,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
  }

  static Future<TimeOfDay?> timePicker({
    required BuildContext context,
    required String doneText,
  }) async {
    DateTime? pickedDate;
    if (Platform.isIOS) {
      await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            actions: [
              SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  onDateTimeChanged: (value) => pickedDate = value,
                  mode: CupertinoDatePickerMode.time,
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text(doneText),
              onPressed: () => Navigator.pop(context),
            ),
          );
        },
      );

      return pickedDate != null ? TimeOfDay.fromDateTime(pickedDate!) : null;
    }

    return await showTimePicker(
      context: context,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Theme.of(context).colorScheme.primary,
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          child: child!,
        );
      },
      initialTime: TimeOfDay.now(),
    );
  }

  static Future<bool?> twoButtons({
    required BuildContext context,
    required Widget title,
    VoidCallback? onNoPressed,
    VoidCallback? onYesPressed,
    String? yesText,
  }) {
    if (Platform.isIOS) {
      return showCupertinoDialog<bool>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: title,
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: onNoPressed ?? () => Navigator.of(context).pop(),
              child: const Text('No', style: TextStyle(color: Colors.white)),
            ),
            CupertinoDialogAction(
              onPressed: onYesPressed,
              child: Text(
                yesText ?? 'Yes',
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      );
    }

    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: title,
        actions: <Widget>[
          ElevatedButton(
            onPressed: onNoPressed,
            child: const Text('No', style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: onYesPressed,
            child: Text(yesText ?? 'Yes',
                style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  static Future<void> error(
    BuildContext context, {
    required String title,
    required VoidCallback onPressed,
    String? body,
  }) {
    return showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 600),
      transitionBuilder: (ctx, a1, a2, child) {
        return Transform.scale(
          scale: Curves.easeInOut.transform(a1.value),
          child: Dialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 45),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      // title
                      Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 12),
                      Text(body ?? ''),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: onPressed,
                            child: const Text(
                              'Ok',
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 1,
                  bottom: body == null ? 1 : 55,
                  right: body == null ? 1 : 230,
                  child: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 45,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                        child: Icon(
                          Icons.warning,
                          color: Colors.red,
                          size: 50,
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
    );

    // return showCupertinoDialog<bool>(
    //   context: context,
    //   builder: (context) => CupertinoAlertDialog(
    //     title: Text(title),
    //     content: Text(body ?? ''),
    //     actions: <Widget>[
    //       CupertinoDialogAction(
    //         onPressed: onPressed,
    //         child: const Text('Ok'),
    //       ),
    //     ],
    //   ),
    // );
  }

  static Future<void> information(BuildContext context,
      {required String title, String? body, VoidCallback? onPressed}) {
    if (Platform.isAndroid) {
      return showGeneralDialog(
        context: context,
        transitionDuration: const Duration(milliseconds: 600),
        transitionBuilder: (ctx, a1, a2, child) {
          return Transform.scale(
            scale: Curves.easeInOut.transform(a1.value),
            child: Dialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 45),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        // title
                        Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(body ?? ''),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: onPressed ??
                                  () => Navigator.of(context).pop(),
                              child: const Text(
                                'Ok',
                                style: TextStyle(fontSize: 16),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        pageBuilder: (ctx, a1, a2) {
          return Container();
        },
      );
    }

    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body ?? ''),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: onPressed ?? () => Navigator.of(context).pop(),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  static Future<void> thinLoading(BuildContext context) {
    if (!Platform.isIOS) {
      return showDialog<bool>(
        context: context,
        builder: (context) => const AlertDialog(
          actions: <Widget>[
            SizedBox(
              height: 60,
              child: Center(child: CircularProgressIndicator.adaptive()),
            ),
          ],
        ),
      );
    }
    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) => const CupertinoAlertDialog(
        actions: <Widget>[
          SizedBox(
            height: 60,
            child: Center(child: CircularProgressIndicator.adaptive()),
          ),
        ],
      ),
    );
  }
}
