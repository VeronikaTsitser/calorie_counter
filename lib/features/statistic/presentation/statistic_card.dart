import 'package:calorie_counter/core/presentation/pop_ups.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_container.dart';
import 'package:calorie_counter/features/statistic/domain/enum.dart';
import 'package:calorie_counter/features/statistic/logic/statistic_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticCard extends StatelessWidget {
  const StatisticCard({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StatisticNotifier>();
    return BaseAppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Статистика', style: AppTextStyle.s20w700),
          const DatePeriodButton(),
          const SizedBox(height: 12),
          _StatisticContainer(title: 'Всего калорий', value: notifier.totalCalories, measurements: 'ккал'),
          _StatisticContainer(title: 'Всего жидкости', value: notifier.totalWater, measurements: 'мл', isLast: true),
        ],
      ),
    );
  }
}

class DatePeriodButton extends StatefulWidget {
  const DatePeriodButton({
    super.key,
  });

  @override
  State<DatePeriodButton> createState() => _DatePeriodButtonState();
}

class _DatePeriodButtonState extends State<DatePeriodButton> {
  String title = 'Сегодня';

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<StatisticNotifier>();
    return GestureDetector(
      onTap: () =>
          showAppActionSheet<TimePeriodEnum>(context: context, child: const _ChooseDatePeriodActionSheet()).then(
        (value) {
          if (value != null) {
            switch (value) {
              case TimePeriodEnum.today:
                notifier.setTimePeriod(TimePeriodEnum.today);
                setState(() => title = 'Сегодня');
                break;
              case TimePeriodEnum.week:
                notifier.setTimePeriod(TimePeriodEnum.week);
                setState(() => title = 'Неделя');
                break;
              case TimePeriodEnum.month:
                notifier.setTimePeriod(TimePeriodEnum.month);
                setState(() => title = 'Месяц');
                break;
            }
          }
        },
      ),
      child: Row(
        children: [
          Text(title, style: AppTextStyle.s20w700),
          SizedBox(
            width: 40,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.arrowtriangle_down_fill),
              iconSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChooseDatePeriodActionSheet extends StatelessWidget {
  const _ChooseDatePeriodActionSheet();

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          child: const Text('Сегодня'),
          onPressed: () => Navigator.pop(context, TimePeriodEnum.today),
        ),
        CupertinoActionSheetAction(
          child: const Text('Неделя'),
          onPressed: () => Navigator.pop(context, TimePeriodEnum.week),
        ),
        CupertinoActionSheetAction(
          child: const Text('Месяц'),
          onPressed: () => Navigator.pop(context, TimePeriodEnum.month),
        )
      ],
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
