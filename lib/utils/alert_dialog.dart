import 'package:flutter/material.dart';

class DialogUtils {
  static Future<bool?> alerta(context) async {
    return await showDialog<bool>(
      context: context,
      builder: (contexta) => AlertDialog(
        title: Text("Test"),
        content: Text("test"),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Cancel")),
          TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Ok')),
        ],
      ),
    );
  }
}
