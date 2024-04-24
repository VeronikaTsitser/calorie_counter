import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/time_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseAppInputWidget<T> extends StatelessWidget {
  const BaseAppInputWidget({
    super.key,
    required this.label,
    this.onChanged,
    this.keyboardType,
    required this.isEditMode,
    this.value,
    this.measurement,
  });
  final String label;
  final ValueChanged<String?>? onChanged;
  final TextInputType? keyboardType;
  final bool isEditMode;
  final T? value;
  final String? measurement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: 0.3.sw, child: Text(label, style: AppTextStyle.s16w400)),
            const SizedBox(width: 20),
            if (!isEditMode && value != null)
              Text(measurement != null ? '$value $measurement' : '$value', style: AppTextStyle.s16w400),
            if (isEditMode)
              Flexible(
                child: TextFormField(
                  initialValue: value?.toString(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите значение';
                    }
                    return null;
                  },
                  style: AppTextStyle.s16w400,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    isCollapsed: true,
                    hintText: 'Введите значение',
                    hintStyle: AppTextStyle.s16w400.copyWith(color: AppColors.hint),
                    border: InputBorder.none,
                  ),
                  keyboardType: keyboardType,
                  onChanged: onChanged,
                ),
              ),
          ],
        ),
        const Divider(height: 14),
      ],
    );
  }
}

class BaseAppNotRequiredInputWidget<T> extends StatelessWidget {
  const BaseAppNotRequiredInputWidget({
    super.key,
    required this.label,
    this.onChanged,
    this.keyboardType,
    required this.isEditMode,
    this.value,
    this.measurement,
  });
  final String label;
  final ValueChanged<String?>? onChanged;
  final TextInputType? keyboardType;
  final bool isEditMode;
  final T? value;
  final String? measurement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: 0.3.sw, child: Text(label, style: AppTextStyle.s16w400)),
            const SizedBox(width: 20),
            if (!isEditMode && value != null)
              Text(measurement != null ? '$value $measurement' : '$value', style: AppTextStyle.s16w400),
            if (isEditMode)
              Flexible(
                child: TextFormField(
                  initialValue: value?.toString(),
                  style: AppTextStyle.s16w400,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    isCollapsed: true,
                    hintText: 'Необязательное поле',
                    hintStyle: AppTextStyle.s16w400.copyWith(color: AppColors.hint),
                    border: InputBorder.none,
                  ),
                  keyboardType: keyboardType,
                  onChanged: onChanged,
                ),
              ),
          ],
        ),
        const Divider(height: 14),
      ],
    );
  }
}

class BaseAppTimeInputWidget extends StatelessWidget {
  const BaseAppTimeInputWidget({
    super.key,
    required this.label,
    required this.onTimeChanged,
    required this.isEditMode,
    required this.time,
  });

  final String label;
  final ValueChanged<DateTime?> onTimeChanged;
  final bool isEditMode;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: 0.3.sw, child: Text(label, style: AppTextStyle.s16w400)),
            const SizedBox(width: 20),
            TimeContainer(onChanged: (value) => onTimeChanged(value), isEditMode: isEditMode, time: time)
          ],
        ),
        const Divider(height: 14),
      ],
    );
  }
}
