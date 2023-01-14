import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class DialogUtils {
  static Future<bool?> alertInformation(
      BuildContext context, String title, String message) async {
    if (Platform.isAndroid) {
      return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: title.isNotEmpty ? Text(title) : null,
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Cancel")),
            TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Ok')),
          ],
        ),
      );
    } else {
      return await showDialog<bool>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: title.isNotEmpty ? Text(title) : null,
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Cancel")),
            TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Ok')),
          ],
        ),
      );
    }
  }
}
