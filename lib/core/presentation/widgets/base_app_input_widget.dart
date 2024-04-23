import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/time_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseAppInputWidget extends StatelessWidget {
  const BaseAppInputWidget({
    super.key,
    required this.label,
    this.onChanged,
    this.onTimeChanged,
    this.keyboardType,
  });
  final String label;

  final ValueChanged<String?>? onChanged;
  final ValueChanged<DateTime?>? onTimeChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: 0.3.sw, child: Text(label, style: AppTextStyle.s16w400)),
            const SizedBox(width: 20),
            if (onTimeChanged != null)
              TimeContainer(onChanged: (value) => onTimeChanged!(value))
            else
              Flexible(
                child: TextFormField(
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
                  keyboardType: keyboardType ?? TextInputType.number,
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

class BaseAppNotRequiredInputWidget extends StatelessWidget {
  const BaseAppNotRequiredInputWidget({
    super.key,
    required this.label,
    this.onChanged,
    this.keyboardType,
  });
  final String label;
  final ValueChanged<String?>? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: 0.3.sw, child: Text(label, style: AppTextStyle.s16w400)),
            const SizedBox(width: 20),
            Flexible(
              child: TextFormField(
                style: AppTextStyle.s16w400,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  isCollapsed: true,
                  hintText: 'Необязательное поле',
                  hintStyle: AppTextStyle.s16w400.copyWith(color: AppColors.hint),
                  border: InputBorder.none,
                ),
                keyboardType: keyboardType ?? TextInputType.number,
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
