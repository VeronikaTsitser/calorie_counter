import 'package:calorie_counter/core/presentation/bottom_sheets.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_container.dart';
import 'package:calorie_counter/features/calorie_counter/domain/models/food_consuming_model.dart';
import 'package:calorie_counter/features/calorie_counter/logic/food_consuming_notifier.dart';
import 'package:calorie_counter/features/calorie_counter/presentation/widgets/food_consuming_bottom_sheet_widget.dart';
import 'package:calorie_counter/features/statistic/logic/statistic_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalorieCounterCard extends StatelessWidget {
  const CalorieCounterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FoodConsumingNotifier>();
    return BaseAppContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Подсчет калорий', style: AppTextStyle.s20w700),
        const SizedBox(height: 20),
        if (notifier.foodConsumingList.isNotEmpty) ...[
          ...notifier.foodConsumingList.map((e) => _FoodConsumingContainer(foodName: e.name, calories: e.calories)),
          const SizedBox(height: 8),
        ],
        if (notifier.foodConsumingList.isEmpty) ...[
          const Center(child: Text('Добавьте информацию о питании', style: AppTextStyle.s16w400)),
          const SizedBox(height: 20),
        ],
        ElevatedButton(
            onPressed: () {
              final statisticNotifier = context.read<StatisticNotifier>();
              final foodConsumingNotifier = context.read<FoodConsumingNotifier>();
              showAppModalBottomSheet<FoodConsumingModel>(
                      context: context, child: const FoodConsumingBottomSheetWidget())
                  .then(
                (value) {
                  if (value != null) {
                    foodConsumingNotifier
                        .addFoodConsuming(
                            foodName: value.name,
                            calories: value.calories,
                            foodConsumingTime: value.time,
                            composition: value.composition,
                            comment: value.comment,
                            cost: value.cost)
                        .then((_) => statisticNotifier.getTotalCalories());
                  }
                },
              );
            },
            child: const Text('Добавить прием пищи')),
      ],
    ));
  }
}

class _FoodConsumingContainer extends StatelessWidget {
  const _FoodConsumingContainer({required this.foodName, required this.calories});
  final String foodName;
  final int calories;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(color: AppColors.primaryBg, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(foodName, style: AppTextStyle.s16w600.copyWith(color: AppColors.primary)),
          Text('$calories ккал', style: AppTextStyle.s16w600.copyWith(color: AppColors.primary)),
        ],
      ),
    );
  }
}
