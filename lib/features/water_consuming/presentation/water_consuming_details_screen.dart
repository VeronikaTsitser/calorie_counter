import 'package:auto_route/auto_route.dart';
import 'package:calorie_counter/core/presentation/pop_ups.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_container.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_input_widget.dart';
import 'package:calorie_counter/features/water_consuming/logic/water_consuming_details_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WaterConsumingDetailsScreen extends StatelessWidget {
  const WaterConsumingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(notifier.title, style: AppTextStyle.s20w700),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.ellipsis, color: AppColors.primary),
            onPressed: () =>
                showAppActionSheet<PopUpAction?>(context: context, child: const EditDeleteActionSheet()).then(
              (value) {
                if (value == PopUpAction.edit) {
                  // notifier.setEditMode(true);
                }
              },
            ),
          ),
        ],
      ),
      body: const _FoodConsumingDetailsBody(),
    );
  }
}

class _FoodConsumingDetailsBody extends StatefulWidget {
  const _FoodConsumingDetailsBody();

  @override
  State<_FoodConsumingDetailsBody> createState() => _FoodConsumingDetailsBodyState();
}

class _FoodConsumingDetailsBodyState extends State<_FoodConsumingDetailsBody> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<WaterConsumingDetailsNotifier>();
    final isEditMode = notifier.isEditMode;
    return Form(
      key: _formKey,
      child: SafeArea(
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
                      BaseAppTimeInputWidget(
                          time: notifier.waterConsumingTime,
                          isEditMode: isEditMode,
                          label: 'Время приема',
                          onTimeChanged: (value) {
                            if (value != null) {
                              notifier.setWaterConsumingTime(value);
                            }
                          }),
                      BaseAppInputWidget(
                        isEditMode: isEditMode,
                        label: 'Объем',
                        keyboardType: TextInputType.number,
                        value: notifier.waterConsuming,
                        onChanged: (value) {
                          if (value != null) {
                            final getCalories = int.tryParse(value);
                            if (getCalories != null) {
                              notifier.setWaterConsuming(getCalories);
                            }
                          }
                        },
                      ),
                      if (notifier.isEditMode) ...[
                        const SizedBox(height: 13),
                        ElevatedButton(
                          child: const Text('Готово'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              notifier.updateWaterConsuming();
                            }
                          },
                        ),
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
