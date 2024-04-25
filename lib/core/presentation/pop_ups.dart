import 'dart:developer';

import 'package:flutter/cupertino.dart';

Future<T?> showAppActionSheet<T>({required BuildContext context, required Widget child}) {
  return showCupertinoModalPopup<T>(
    context: context,
    builder: (context) => child,
  ).then((value) {
    log('value: $value');
    return value;
  });
}

class EditDeleteActionSheet extends StatelessWidget {
  const EditDeleteActionSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          child: const Text('Редактировать'),
          onPressed: () => Navigator.pop(context, PopUpAction.edit),
        ),
        CupertinoActionSheetAction(
          child: const Text('Удалить данные', style: TextStyle(color: CupertinoColors.destructiveRed)),
          onPressed: () => Navigator.pop(context, PopUpAction.clear),
        )
      ],
    );
  }
}

enum PopUpAction { edit, clear }

Future<T?> showAppCupertinoDialog<T>({required BuildContext context, required Widget child}) {
  return showCupertinoDialog<T>(context: context, builder: (BuildContext context) => child).then((value) {
    log('value: $value');
    return value;
  });
}

class DeleteAlertDialogWidget extends StatelessWidget {
  const DeleteAlertDialogWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text('Отмена'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Удалить'),
        ),
      ],
    );
  }
}

Future<DateTime?> showAppTimePicker(BuildContext context, DateTime initialTime) => showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => AppTimePicker(initialTime: initialTime),
    ).then((value) {
      log('value: $value');
      return value;
    });

class AppTimePicker extends StatefulWidget {
  const AppTimePicker({
    super.key,
    required this.initialTime,
  });
  final DateTime initialTime;

  @override
  State<AppTimePicker> createState() => _AppTimePickerState();
}

class _AppTimePickerState extends State<AppTimePicker> {
  late DateTime value = widget.initialTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              initialDateTime: widget.initialTime,
              onDateTimeChanged: (DateTime newTime) => value = newTime,
            ),
          ),
          CupertinoButton(
            child: const Text('Готово'),
            onPressed: () => Navigator.pop(context, value),
          ),
        ],
      ),
    );
  }
}
