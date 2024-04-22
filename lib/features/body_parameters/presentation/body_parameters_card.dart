import 'package:calorie_counter/core/presentation/pop_ups.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_container.dart';
import 'package:calorie_counter/features/body_parameters/logic/body_parameters_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BodyParametersCard extends StatelessWidget {
  const BodyParametersCard({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<BodyParameterNotifier>();
    final isEditMode = notifier.isEditMode;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: BaseAppContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Параметры тела', style: AppTextStyle.s20w700),
                  if (!isEditMode)
                    IconButton(
                      onPressed: () {
                        showActionSheet(context).then((value) {
                          if (value == PopUpAction.edit) {
                            context.read<BodyParameterNotifier>().setEditMode(true);
                          }
                          if (value == PopUpAction.clear) {
                            context.read<BodyParameterNotifier>().clearBodyParameters();
                          }
                        });
                      },
                      icon: const Icon(CupertinoIcons.ellipsis, color: AppColors.primary),
                    )
                ],
              ),
            ),
            const SizedBox(height: 15),
            _BodyParameterWidget(
              label: 'Вес',
              measurement: 'кг',
              value: notifier.weight,
              onChanged: (value) => notifier.setWeight(double.parse(value)),
            ),
            _BodyParameterWidget(
              label: 'Рост',
              measurement: 'см',
              value: notifier.height,
              onChanged: (value) => notifier.setHeight(int.parse(value)),
            ),
            _BodyParameterWidget(
              label: 'Процент жира',
              measurement: '%',
              value: notifier.fatPercentage,
              onChanged: (value) => notifier.setFatPercentage(int.parse(value)),
            ),
            _BodyParameterWidget(
              label: 'Необходимое количество калорий',
              measurement: 'ккал',
              value: notifier.calories,
              onChanged: (value) => notifier.setCalories(int.parse(value)),
            ),
            _BodyParameterWidget(
              label: 'Необходимое количество жидкости',
              measurement: 'мл',
              value: notifier.water,
              onChanged: (value) => notifier.setWater(int.parse(value)),
            ),
            if (isEditMode) ...[
              const SizedBox(height: 13),
              ElevatedButton(
                child: const Text('Готово'),
                onPressed: () => context.read<BodyParameterNotifier>().saveBodyParameters(),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class _BodyParameterWidget extends StatelessWidget {
  const _BodyParameterWidget({
    required this.label,
    required this.measurement,
    required this.value,
    required this.onChanged,
  });
  final String label;
  final String measurement;
  final num? value;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final isEditMode = context.watch<BodyParameterNotifier>().isEditMode;
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: 0.3.sw, child: Text(label, style: AppTextStyle.s16w400)),
            const SizedBox(width: 20),
            if (!isEditMode && value != null) Text('$value $measurement', style: AppTextStyle.s16w400),
            if (!isEditMode && value == null) Text('- $measurement', style: AppTextStyle.s16w400),
            if (isEditMode)
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
