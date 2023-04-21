import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void errorDialog(BuildContext context, String errorMessage) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => 
        CupertinoAlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            CupertinoDialogAction(child: const Text('OK'), onPressed: () => Navigator.pop(context))
          ],
        )
    );
  } else {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => 
        AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(child: const Text('OK'), onPressed: () => Navigator.pop(context))
          ],
        )
      );
  }
}