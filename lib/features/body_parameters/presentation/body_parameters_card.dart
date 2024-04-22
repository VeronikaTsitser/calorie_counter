import 'package:calorie_counter/core/presentation/base_app_container.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/features/body_parameters/logic/body_parameters_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BodyParametersCard extends StatefulWidget {
  const BodyParametersCard({super.key});

  @override
  State<BodyParametersCard> createState() => _BodyParametersCardState();
}

class _BodyParametersCardState extends State<BodyParametersCard> {
  bool isEditMode = true;
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController fatPercentageController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController waterController = TextEditingController();

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    fatPercentageController.dispose();
    caloriesController.dispose();
    waterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<BodyParameterNotifier>().getBodyParameters().then((value) => {
          weightController.text = '${value.weight.toString()} кг',
          heightController.text = '${value.height.toString()} см',
          fatPercentageController.text = '${value.fatPercentage.toString()} %',
          caloriesController.text = '${value.calories.toString()} ккал',
          waterController.text = '${value.water.toString()} мл',
        });
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
            const Text('Параметры тела', style: AppTextStyle.s20w700),
            const SizedBox(height: 15),
            _BodyParameterWidget(label: 'Вес', controller: weightController),
            _BodyParameterWidget(label: 'Рост', controller: heightController),
            _BodyParameterWidget(label: 'Процент жира', controller: fatPercentageController),
            _BodyParameterWidget(label: 'Необходимое количество калорий', controller: caloriesController),
            _BodyParameterWidget(label: 'Необходимое количество жидкости', controller: waterController),
            if (isEditMode) ...[
              const SizedBox(height: 13),
              ElevatedButton(
                child: const Text('Готово'),
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                    currentFocus.focusedChild!.unfocus();
                  }
                  context.read<BodyParameterNotifier>().setBodyParameters(
                        weight: double.tryParse(weightController.text),
                        height: int.tryParse(heightController.text),
                        fatPercentage: int.tryParse(fatPercentageController.text),
                        calories: int.tryParse(caloriesController.text),
                        water: int.tryParse(waterController.text),
                      );
                  isEditMode = false;
                },
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class _BodyParameterWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? initialValue;

  const _BodyParameterWidget({required this.label, required this.controller, this.initialValue});

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
                controller: controller,
                initialValue: initialValue,
                decoration: InputDecoration(
                  hintText: 'Введите значение',
                  hintStyle: AppTextStyle.s16w400.copyWith(color: AppColors.hint),
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
