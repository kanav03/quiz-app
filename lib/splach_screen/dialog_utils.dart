import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static Future<bool?> showExitConfirmationDialog(BuildContext context) async {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Confirm'),
          content: const Text('Do you want to exit the app?'),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context, true); // Return true for 'Yes'
              },
              child: const Text('Yes'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context, false); // Return false for 'No'
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
