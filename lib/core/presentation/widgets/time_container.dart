import 'package:calorie_counter/core/presentation/pop_ups.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:flutter/material.dart';

class TimeContainer extends StatefulWidget {
  const TimeContainer({super.key, required this.onChanged});
  final ValueChanged<DateTime?> onChanged;

  @override
  State<TimeContainer> createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  DateTime time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final String timeNow = '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    return GestureDetector(
      onTap: () => showAppTimePicker(context, time).then((value) {
        widget.onChanged(value);
        if (value != null) {
          setState(() {
            time = value;
          });
        }
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppColors.greyContainer),
        child: Center(child: Text(timeNow, style: AppTextStyle.s16w400.copyWith(color: AppColors.primary))),
      ),
    );
  }
}
