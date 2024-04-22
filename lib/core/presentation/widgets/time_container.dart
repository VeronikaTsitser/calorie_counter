import 'package:calorie_counter/core/presentation/pop_ups.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:flutter/material.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showAppTimePicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppColors.greyContainer),
        child: Center(child: Text('12:00', style: AppTextStyle.s16w400.copyWith(color: AppColors.primary))),
      ),
    );
  }
}
