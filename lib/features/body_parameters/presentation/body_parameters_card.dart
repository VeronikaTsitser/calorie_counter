import 'package:calorie_counter/core/presentation/base_app_container.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyParametersCard extends StatelessWidget {
  const BodyParametersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Параметры тела', style: AppTextStyle.s20w700),
          const SizedBox(height: 15),
          const _BodyParameterWidget(label: 'Вес'),
          const _BodyParameterWidget(label: 'Рост'),
          const _BodyParameterWidget(label: 'Процент жира'),
          const _BodyParameterWidget(label: 'Необходимое количество калорий'),
          const _BodyParameterWidget(label: 'Необходимое количество жидкости'),
          const SizedBox(height: 13),
          ElevatedButton(
            child: const Text('Готово'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _BodyParameterWidget extends StatelessWidget {
  final String label;

  const _BodyParameterWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: 0.3.sw, child: Text(label, style: AppTextStyle.s16w400)),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Введите значение',
                  labelStyle: AppTextStyle.s16w400.copyWith(color: AppColors.hint),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const Divider(height: 14),
      ],
    );
  }
}
