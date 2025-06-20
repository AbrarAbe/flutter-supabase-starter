import 'package:flutter/material.dart';

enum SnackBarType { error, success, info }

SnackBar mySnackBar({
  required BuildContext context,
  required String content,
  required SnackBarType snackBarType,
}) {
  final backgroundColor = switch (snackBarType) {
    SnackBarType.error => Colors.red,
    SnackBarType.success => Colors.green,
    SnackBarType.info => Colors.blue,
  };
  return SnackBar(
    content: Text(content),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(25),
    showCloseIcon: true,
    elevation: 1,
    duration: const Duration(seconds: 3),
    dismissDirection: DismissDirection.horizontal,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: backgroundColor,
  );
}
