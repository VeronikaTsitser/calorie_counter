import 'package:calorie_counter/core/presentation/widgets/base_app_bottom_sheet_widget.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_input_widget.dart';
import 'package:calorie_counter/features/calorie_counter/domain/models/food_consuming_model.dart';
import 'package:flutter/material.dart';

class FoodConsumingBottomSheetWidget extends StatefulWidget {
  const FoodConsumingBottomSheetWidget({super.key});

  @override
  State<FoodConsumingBottomSheetWidget> createState() => _FoodConsumingBottomSheetWidgetState();
}

class _FoodConsumingBottomSheetWidgetState extends State<FoodConsumingBottomSheetWidget> {
  final formKey = GlobalKey<FormState>();
  String _foodName = '';
  int _calories = 0;
  DateTime _time = DateTime.now();
  String? _composition;
  String? _comment;
  double? _cost;

  @override
  Widget build(BuildContext context) {
    return BaseAppBottomSheetWidget(
      onTap: () {
        if (formKey.currentState!.validate()) {
          Navigator.pop(
            context,
            FoodConsumingModel(
                name: _foodName,
                calories: _calories,
                time: _time,
                comment: _comment,
                composition: _composition,
                cost: _cost),
          );
        }
      },
      title: 'Добавление приёма пищи',
      formKey: formKey,
      child: Column(
        children: [
          BaseAppInputWidget(
            label: 'Название',
            keyboardType: TextInputType.text,
            onChanged: (value) {
              if (value != null) {
                _foodName = value;
              }
            },
          ),
          BaseAppInputWidget(
            label: 'Количество калорий',
            onChanged: (value) {
              if (value != null) {
                _calories = int.parse(value);
              }
            },
          ),
          BaseAppInputWidget(
              label: 'Время приёма пищи',
              onTimeChanged: (value) {
                if (value != null) {
                  _time = value;
                }
              }),
          BaseAppNotRequiredInputWidget(
            label: 'Состав',
            keyboardType: TextInputType.text,
            onChanged: (value) => _composition = value,
          ),
          BaseAppNotRequiredInputWidget(
            label: 'Комментарий',
            keyboardType: TextInputType.text,
            onChanged: (value) => _comment = value,
          ),
          BaseAppNotRequiredInputWidget(
              label: 'Стоимость',
              onChanged: (value) {
                if (value != null) _cost = double.parse(value);
              }),
        ],
      ),
    );
  }
}
