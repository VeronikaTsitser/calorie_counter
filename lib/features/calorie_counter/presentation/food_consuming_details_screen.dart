import 'package:auto_route/auto_route.dart';
import 'package:calorie_counter/core/presentation/pop_ups.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_container.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_input_widget.dart';
import 'package:calorie_counter/features/calorie_counter/logic/food_consuming_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FoodConsumingDetailsScreen extends StatelessWidget {
  const FoodConsumingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<FoodConsumingNotifier>();
    final isEditMode = notifier.isEditMode;
    return Scaffold(
      appBar: AppBar(
        title: Text(notifier.title, style: AppTextStyle.s20w700),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.ellipsis, color: AppColors.primary),
            onPressed: () =>
                showAppActionSheet<PopUpAction?>(context: context, child: const EditDeleteActionSheet()).then((value) {
              if (value == PopUpAction.edit) {
                notifier.setEditMode(true);
              }
            }),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: BaseAppContainer(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BaseAppInputWidget(
                        isEditMode: isEditMode,
                        label: 'Название',
                        value: notifier.title,
                        onChanged: (value) {
                          if (value != null) {
                            notifier.setTitle(value);
                          }
                        },
                      ),
                      BaseAppInputWidget(
                        isEditMode: isEditMode,
                        label: 'Количество калорий',
                        keyboardType: TextInputType.number,
                        value: notifier.calories,
                        onChanged: (value) {
                          if (value != null) {
                            notifier.setCalories(int.parse(value));
                          }
                        },
                      ),
                      BaseAppTimeInputWidget(
                          time: notifier.foodConsumingTime,
                          isEditMode: isEditMode,
                          label: 'Время приема',
                          onTimeChanged: (value) {
                            if (value != null) {
                              notifier.setFoodConsumingTime(value);
                            }
                          }),
                      BaseAppNotRequiredInputWidget(
                        isEditMode: isEditMode,
                        label: 'Состав',
                        value: notifier.composition,
                        onChanged: (value) {
                          if (value != null) {
                            notifier.setComposition(value);
                          }
                        },
                      ),
                      BaseAppNotRequiredInputWidget(
                        isEditMode: isEditMode,
                        label: 'Комментарий',
                        value: notifier.comment,
                        onChanged: (value) {
                          if (value != null) {
                            notifier.setComment(value);
                          }
                        },
                      ),
                      BaseAppNotRequiredInputWidget(
                        isEditMode: isEditMode,
                        label: 'Стоимость',
                        value: notifier.cost,
                        keyboardType: TextInputType.number,
                        measurement: 'р.',
                        onChanged: (value) {
                          if (value != null) {
                            notifier.setCost(double.parse(value));
                          }
                        },
                      ),
                      if (notifier.isEditMode) ...[
                        const SizedBox(height: 13),
                        ElevatedButton(child: const Text('Готово'), onPressed: () => notifier.updateFoodConsuming()),
                      ]
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}