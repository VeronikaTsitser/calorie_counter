import 'package:auto_size_text/auto_size_text.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/time_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showWaterModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(CupertinoIcons.chevron_left, color: AppColors.primary),
                    Text('Назад', style: AppTextStyle.s16w600.copyWith(color: AppColors.primary)),
                  ],
                ),
                SizedBox(
                    width: 0.45.sw,
                    child: const AutoSizeText(
                      'Добавление приёма жидкости',
                      style: AppTextStyle.s16w600,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    )),
                Text('Готово', style: AppTextStyle.s16w600.copyWith(color: AppColors.primary)),
              ],
            ),
            const SizedBox(height: 20),
            const _WaterConsumingTextField(label: 'Название', value: 1),
            const _WaterConsumingTextField(label: 'Время приема', value: null, isTime: true),
            const _WaterConsumingTextField(label: 'Объем', value: null),
          ],
        ),
      );
    },
  );
}

class _WaterConsumingTextField extends StatelessWidget {
  const _WaterConsumingTextField({
    required this.label,
    required this.value,
    this.isTime = false,
  });
  final String label;
  final bool isTime;
  final num? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: 0.3.sw, child: Text(label, style: AppTextStyle.s16w400)),
            const SizedBox(width: 20),
            if (isTime)
              const TimeContainer()
            else
              Flexible(
                child: TextFormField(
                  style: AppTextStyle.s16w400,
                  initialValue: value?.toString(),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    isCollapsed: true,
                    hintText: 'Введите значение',
                    hintStyle: AppTextStyle.s16w400.copyWith(color: AppColors.hint),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  // onChanged: onChanged,
                ),
              ),
          ],
        ),
        const Divider(height: 14),
      ],
    );
  }
}
