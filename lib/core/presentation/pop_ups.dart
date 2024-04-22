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
