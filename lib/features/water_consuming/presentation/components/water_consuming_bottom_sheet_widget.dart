import 'package:calorie_counter/core/presentation/widgets/base_app_bottom_sheet_widget.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_input_widget.dart';
import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';
import 'package:flutter/material.dart';

class WaterConsumingBottomSheetWidget extends StatefulWidget {
  const WaterConsumingBottomSheetWidget({
    super.key,
  });

  @override
  State<WaterConsumingBottomSheetWidget> createState() => _WaterConsumingBottomSheetWidgetState();
}

class _WaterConsumingBottomSheetWidgetState extends State<WaterConsumingBottomSheetWidget> {
  String _drinkName = '';
  DateTime _lastWaterConsumingTime = DateTime.now();
  int _waterConsuming = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseAppBottomSheetWidget(
      title: 'Добавить употребление жидкости',
      onTap: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pop(
              context,
              WaterConsumingModel(
                id: DateTime.now().millisecondsSinceEpoch,
                name: _drinkName,
                consumedWaterValue: _waterConsuming,
                time: _lastWaterConsumingTime,
              ));
        }
      },
      formKey: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseAppInputWidget(
            isEditMode: true,
            label: 'Название',
            onChanged: (value) {
              if (value != null) {
                _drinkName = value;
              }
            },
          ),
          BaseAppTimeInputWidget(
            time: _lastWaterConsumingTime,
            isEditMode: true,
            label: 'Время приема',
            onTimeChanged: (value) {
              if (value != null) {
                _lastWaterConsumingTime = value;
              }
            },
          ),
          BaseAppInputWidget(
            isEditMode: true,
            label: 'Объем',
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value != null) {
                final getWater = int.tryParse(value);
                if (getWater != null) {
                  _waterConsuming = getWater;
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
