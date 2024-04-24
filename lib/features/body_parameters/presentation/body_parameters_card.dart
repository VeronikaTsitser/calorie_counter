import 'package:calorie_counter/core/presentation/pop_ups.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_container.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_input_widget.dart';
import 'package:calorie_counter/features/body_parameters/logic/body_parameters_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyParametersCard extends StatefulWidget {
  const BodyParametersCard({super.key});

  @override
  State<BodyParametersCard> createState() => _BodyParametersCardState();
}

class _BodyParametersCardState extends State<BodyParametersCard> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<BodyParameterNotifier>();
    final isEditMode = notifier.isEditMode;
    return Form(
      key: _formKey,
      child: GestureDetector(
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
              _BodyParametersTitle(isEditMode: isEditMode),
              const SizedBox(height: 15),
              BaseAppInputWidget(
                isEditMode: isEditMode,
                label: 'Вес',
                measurement: 'кг',
                value: notifier.weight,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value != null) {
                    notifier.setWeight(double.parse(value));
                  }
                },
              ),
              BaseAppInputWidget(
                isEditMode: isEditMode,
                label: 'Рост',
                measurement: 'см',
                value: notifier.height,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value != null) {
                    notifier.setHeight(int.parse(value));
                  }
                },
              ),
              BaseAppInputWidget(
                isEditMode: isEditMode,
                label: 'Процент жира',
                measurement: '%',
                value: notifier.fatPercentage,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value != null) {
                    notifier.setFatPercentage(int.parse(value));
                  }
                },
              ),
              BaseAppInputWidget(
                  isEditMode: isEditMode,
                  label: 'Необходимое количество калорий',
                  measurement: 'ккал',
                  value: notifier.calories,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value != null) {
                      notifier.setCalories(int.parse(value));
                    }
                  }),
              BaseAppInputWidget(
                  isEditMode: isEditMode,
                  label: 'Необходимое количество жидкости',
                  measurement: 'мл',
                  value: notifier.water,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value != null) {
                      notifier.setWater(int.parse(value));
                    }
                  }),
              if (isEditMode) ...[
                const SizedBox(height: 13),
                ElevatedButton(
                  child: const Text('Готово'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<BodyParameterNotifier>().saveBodyParameters();
                    }
                  },
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _BodyParametersTitle extends StatelessWidget {
  const _BodyParametersTitle({required this.isEditMode});

  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Параметры тела', style: AppTextStyle.s20w700),
          if (!isEditMode)
            IconButton(
              onPressed: () {
                showAppActionSheet<PopUpAction>(context: context, child: const EditDeleteActionSheet()).then((value) {
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
    );
  }
}
