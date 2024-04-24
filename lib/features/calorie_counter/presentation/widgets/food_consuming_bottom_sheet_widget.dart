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
  final _formKey = GlobalKey<FormState>();
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
        if (_formKey.currentState!.validate()) {
          Navigator.pop(
            context,
            FoodConsumingModel(
              id: DateTime.now().millisecondsSinceEpoch,
              name: _foodName,
              calories: _calories,
              time: _time,
              comment: _comment,
              composition: _composition,
              cost: _cost,
            ),
          );
        }
      },
      title: 'Добавление приёма пищи',
      formKey: _formKey,
      child: Column(
        children: [
          BaseAppInputWidget(
            isEditMode: true,
            label: 'Название',
            onChanged: (value) {
              if (value != null) {
                _foodName = value;
              }
            },
          ),
          BaseAppInputWidget(
            isEditMode: true,
            label: 'Количество калорий',
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value != null) {
                final getCalories = int.tryParse(value);
                if (getCalories != null) {
                  _calories = getCalories;
                }
              }
            },
          ),
          BaseAppTimeInputWidget(
              time: _time,
              isEditMode: true,
              label: 'Время приёма пищи',
              onTimeChanged: (value) {
                if (value != null) {
                  _time = value;
                  setState(() {});
                }
              }),
          BaseAppNotRequiredInputWidget(
            isEditMode: true,
            label: 'Состав',
            onChanged: (value) => _composition = value,
          ),
          BaseAppNotRequiredInputWidget(
            isEditMode: true,
            label: 'Комментарий',
            onChanged: (value) => _comment = value,
          ),
          BaseAppNotRequiredInputWidget(
              isEditMode: true,
              keyboardType: TextInputType.number,
              label: 'Стоимость',
              onChanged: (value) {
                if (value != null) {
                  _cost = double.tryParse(value);
                }
              }),
        ],
      ),
    );
  }
}
