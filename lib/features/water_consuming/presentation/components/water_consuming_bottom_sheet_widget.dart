import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/app_base_bottom_sheet_widget.dart';
import 'package:calorie_counter/core/presentation/widgets/time_container.dart';
import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return AppBaseBottomSheetWidget(
      title: 'Добавить употребление жидкости',
      onTap: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pop(
              context,
              WaterConsumingModel(
                name: _drinkName,
                consumedWaterValue: _waterConsuming,
                date: _lastWaterConsumingTime,
              ));
        }
      },
      formKey: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _WaterConsumingTextField(
            keyboardType: TextInputType.text,
            label: 'Название',
            onChanged: (value) {
              if (value != null) {
                _drinkName = value;
              }
            },
          ),
          _WaterConsumingTextField(
            label: 'Время приема',
            onTimeChanged: (value) {
              if (value != null) {
                _lastWaterConsumingTime = value;
              }
            },
          ),
          _WaterConsumingTextField(
            label: 'Объем',
            onChanged: (value) {
              if (value != null) {
                _waterConsuming = int.parse(value);
              }
            },
          ),
        ],
      ),
    );
  }
}

class _WaterConsumingTextField extends StatelessWidget {
  const _WaterConsumingTextField({
    required this.label,
    this.onChanged,
    this.onTimeChanged,
    this.keyboardType,
  });
  final String label;

  final ValueChanged<String?>? onChanged;
  final ValueChanged<DateTime?>? onTimeChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: 0.3.sw, child: Text(label, style: AppTextStyle.s16w400)),
            const SizedBox(width: 20),
            if (onTimeChanged != null)
              TimeContainer(onChanged: (value) => onTimeChanged!(value))
            else
              Flexible(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите значение';
                    }
                    return null;
                  },
                  style: AppTextStyle.s16w400,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    isCollapsed: true,
                    hintText: 'Введите значение',
                    hintStyle: AppTextStyle.s16w400.copyWith(color: AppColors.hint),
                    border: InputBorder.none,
                  ),
                  keyboardType: keyboardType ?? TextInputType.number,
                  onChanged: onChanged,
                ),
              ),
          ],
        ),
        const Divider(height: 14),
      ],
    );
  }
}
