import 'package:calorie_counter/core/presentation/bottom_sheets.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_container.dart';
import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';
import 'package:calorie_counter/features/water_consuming/logic/water_consuming_notifier.dart';
import 'package:calorie_counter/features/water_consuming/presentation/components/water_consuming_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaterConsumingCard extends StatelessWidget {
  const WaterConsumingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<WaterConsumingNotifier>();
    return BaseAppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Употребление жидкости', style: AppTextStyle.s20w700),
          const SizedBox(height: 12),
          if (notifier.waterConsumingList.isNotEmpty)
            Wrap(
              spacing: 14,
              runSpacing: 12,
              children: [
                ...notifier.waterConsumingList
                    .map((e) => _ConsumedWaterContainer(consumedWaterValue: e.consumedWaterValue)),
                const _AddWaterConsumingButton(),
              ],
            ),
          if (notifier.waterConsumingList.isEmpty) const _EmptyWaterConsumingWidget(),
        ],
      ),
    );
  }
}

class _ConsumedWaterContainer extends StatelessWidget {
  const _ConsumedWaterContainer({required this.consumedWaterValue});
  final int consumedWaterValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 68,
      padding: const EdgeInsets.only(top: 6),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.primaryBg),
      child: Column(
        children: [
          Image.asset('assets/icons/liquid_icon.png', width: 40),
          const SizedBox(width: 12),
          FittedBox(
            child: Text('$consumedWaterValue мл', style: AppTextStyle.s12w400.copyWith(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}

class _AddWaterConsumingButton extends StatelessWidget {
  const _AddWaterConsumingButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => showAppModalBottomSheet<WaterConsumingModel>(
                    context: context, child: const WaterConsumingBottomSheetWidget())
                .then(
              (value) {
                if (value != null) {
                  return context.read<WaterConsumingNotifier>().addWaterConsuming(
                      drinkName: value.name,
                      waterConsuming: value.consumedWaterValue,
                      lastWaterConsumingTime: value.date);
                }
              },
            ),
        child: Image.asset('assets/icons/add_button_icon.png', width: 68));
  }
}

class _EmptyWaterConsumingWidget extends StatelessWidget {
  const _EmptyWaterConsumingWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _AddWaterConsumingButton(),
        SizedBox(width: 12),
        Flexible(
          child: Text(
            'Добавьте информацию о количестве выпитой жидкости',
            style: AppTextStyle.s16w400,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
