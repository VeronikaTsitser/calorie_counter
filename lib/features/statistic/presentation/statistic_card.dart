import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_container.dart';
import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget {
  const StatisticCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseAppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Статистика', style: AppTextStyle.s20w700),
          SizedBox(height: 12),
          _StatisticContainer(title: 'Всего калорий', value: 500, measurements: 'ккал'),
          _StatisticContainer(title: 'Всего жидкости', value: 500, measurements: 'мл', isLast: true),
        ],
      ),
    );
  }
}

class _StatisticContainer extends StatelessWidget {
  const _StatisticContainer(
      {required this.title, required this.value, required this.measurements, this.isLast = false});
  final String title;
  final String measurements;
  final int value;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isLast ? null : const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(color: AppColors.primaryBg, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyle.s16w600.copyWith(color: AppColors.primary)),
          Text('$value $measurements', style: AppTextStyle.s16w600.copyWith(color: AppColors.primary)),
        ],
      ),
    );
  }
}
