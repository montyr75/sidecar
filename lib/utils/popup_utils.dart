import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/error/error_service.dart';
import 'screen_utils.dart';

void showErrorDialog({
  required BuildContext context,
  required AppError error,
}) {
  showPlatformDialog(
    context: context,
    title: error.title,
    message: error.message,
    cancelText: 'Cancel',
  );
}

Future<bool> showConfirmDialog({
  required BuildContext context,
  String title = "???",
  required String message,
  String cancelText = "No",
  String confirmText = "Yes",
}) {
  return showPlatformDialog(
    context: context,
    title: title,
    message: message,
    cancelText: cancelText,
    confirmText: confirmText,
  );
}

Future<bool> showPlatformDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? cancelText,
  String? confirmText,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      if (Theme.of(context).platform == TargetPlatform.iOS) {
        return _buildCupertinoDialog(
          context: context,
          title: title,
          message: message,
          cancelText: cancelText,
          confirmText: confirmText,
        );
      }
      return _buildMaterialDialog(
        context: context,
        title: title,
        message: message,
        cancelText: cancelText,
        confirmText: confirmText,
      );
    },
  );

  return result ?? false;
}

CupertinoAlertDialog _buildCupertinoDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? cancelText,
  String? confirmText,
}) {
  return CupertinoAlertDialog(
    title: title != null ? Text(title) : null,
    content: Text(message),
    actions: [
      if (cancelText != null)
        CupertinoDialogAction(
          child: Text(cancelText),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      if (confirmText != null)
        CupertinoDialogAction(
          child: Text(confirmText),
          onPressed: () => Navigator.of(context).pop(true),
        ),
    ],
  );
}

AlertDialog _buildMaterialDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? cancelText,
  String? confirmText,
}) {
  return AlertDialog(
    title: title != null
        ? Text(
            title,
            style: const TextStyle(fontFamily: 'Facon'),
          )
        : null,
    shape: const BeveledRectangleBorder(
      side: BorderSide(width: 2, color: Colors.white30),
      borderRadius: BorderRadius.all(
        Radius.circular(med),
      ),
    ),
    backgroundColor: Colors.black87,
    content: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Text(message),
    ),
    actions: [
      if (cancelText != null)
        TextButton(
          child: Text(cancelText),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      if (confirmText != null)
        TextButton(
          child: Text(confirmText),
          onPressed: () => Navigator.of(context).pop(true),
        ),
    ],
  );
}

Future<void> showSelectionBottomSheet({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isScrollControlled = false,
}) async {
  await showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 1.0,
    isScrollControlled: isScrollControlled,
    context: context,
    builder: builder,
  );
}
