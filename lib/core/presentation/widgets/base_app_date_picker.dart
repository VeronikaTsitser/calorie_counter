import 'package:flutter/cupertino.dart';

class BaseAppDatePicker extends StatefulWidget {
  const BaseAppDatePicker({super.key, required this.initialDate});
  final DateTime initialDate;

  @override
  State<BaseAppDatePicker> createState() => _BaseAppDatePickerState();
}

class _BaseAppDatePickerState extends State<BaseAppDatePicker> {
  late DateTime _value = widget.initialDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              // maximumDate: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDate) {
                _value = newDate;
              },
            ),
          ),
          // Close the modal
          CupertinoButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(_value),
          )
        ],
      ),
    );
  }
}
