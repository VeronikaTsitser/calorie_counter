import 'package:auto_size_text/auto_size_text.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/time_container.dart';
import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<WaterConsumingModel?> showWaterModalBottomSheet(BuildContext context) async {
  final result = await showModalBottomSheet<WaterConsumingModel>(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (BuildContext context) {
      return const WaterConsumingBottomSheetWidget();
    },
  );
  return result;
}

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
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Row(
                      children: [
                        const Icon(CupertinoIcons.chevron_left, color: AppColors.primary),
                        Text('Назад', style: AppTextStyle.s16w600.copyWith(color: AppColors.primary)),
                      ],
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  SizedBox(
                      width: 0.45.sw,
                      child: const AutoSizeText(
                        'Добавление приёма жидкости',
                        style: AppTextStyle.s16w600,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      )),
                  GestureDetector(
                    child: Text(
                      'Готово',
                      style: AppTextStyle.s16w600.copyWith(color: AppColors.primary),
                    ),
                    onTap: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      Navigator.pop(
                          context,
                          WaterConsumingModel(
                            name: _drinkName,
                            consumedWaterValue: _waterConsuming,
                            date: _lastWaterConsumingTime,
                          ));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
        ),
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
