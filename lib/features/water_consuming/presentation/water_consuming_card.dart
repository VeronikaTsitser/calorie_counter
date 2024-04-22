import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_container.dart';
import 'package:calorie_counter/features/water_consuming/presentation/components/bottom_sheets.dart';
import 'package:flutter/material.dart';

class WaterConsumingCard extends StatelessWidget {
  const WaterConsumingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseAppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Употребление жидкости', style: AppTextStyle.s20w700),
          SizedBox(height: 12),
          // const Wrap(
          //   alignment: WrapAlignment.spaceBetween,
          //   crossAxisAlignment: WrapCrossAlignment.center,
          //   runAlignment: WrapAlignment.spaceBetween,
          //   spacing: 14,
          //   runSpacing: 12,
          //   children: [
          //     _ConsumedWaterContainer(consumedWaterValue: 250),
          //     _ConsumedWaterContainer(consumedWaterValue: 250),
          //     _ConsumedWaterContainer(consumedWaterValue: 150),
          //     _ConsumedWaterContainer(consumedWaterValue: 250),
          //     _ConsumedWaterContainer(consumedWaterValue: 250),
          //     _ConsumedWaterContainer(consumedWaterValue: 250),
          //     _ConsumedWaterContainer(consumedWaterValue: 250),
          //     _ConsumedWaterContainer(consumedWaterValue: 250),
          //     _ConsumedWaterContainer(consumedWaterValue: 250),
          //   ],
          // ),
          _EmptyWaterConsumingWidget(),
        ],
      ),
    );
  }
}

class _EmptyWaterConsumingWidget extends StatelessWidget {
  const _EmptyWaterConsumingWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              showWaterModalBottomSheet(context);
            },
            child: Image.asset('assets/icons/add_button_icon.png', width: 68)),
        const SizedBox(width: 12),
        const Flexible(
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
            child: Text(
              '$consumedWaterValue мл',
              style: AppTextStyle.s12w400.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
