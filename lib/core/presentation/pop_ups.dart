import 'dart:developer';

import 'package:flutter/cupertino.dart';

Future<PopUpAction?> showActionSheet(BuildContext context) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => const ActionSheet(),
  ).then((value) {
    log('value: $value');
    return value;
  });
}

class ActionSheet extends StatelessWidget {
  const ActionSheet({
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
