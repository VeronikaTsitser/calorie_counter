import 'package:flutter/material.dart';

Future<T?> showAppModalBottomSheet<T>({required BuildContext context, required Widget child}) async {
  final result = await showModalBottomSheet<T>(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (BuildContext context) {
      return child;
    },
  );
  return result;
}
