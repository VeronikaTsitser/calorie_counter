import 'package:auto_route/auto_route.dart';
import 'package:calorie_counter/core/presentation/pop_ups.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_date_picker.dart';
import 'package:calorie_counter/features/body_parameters/presentation/body_parameters_card.dart';
import 'package:calorie_counter/features/calorie_counter/logic/food_consuming_notifier.dart';
import 'package:calorie_counter/features/calorie_counter/presentation/calorie_counter_card.dart';
import 'package:calorie_counter/features/dash_board/logic/dash_board_filter_notifier.dart';
import 'package:calorie_counter/features/statistic/presentation/statistic_card.dart';
import 'package:calorie_counter/features/water_consuming/logic/water_consuming_notifier.dart';
import 'package:calorie_counter/features/water_consuming/presentation/water_consuming_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filterNotifier = context.watch<DashBoardFilterNotifier>();
    final date = filterNotifier.selectedDate;
    final foodNotifier = context.watch<FoodConsumingNotifier>();
    final waterNotifier = context.watch<WaterConsumingNotifier>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SharedPreferences.getInstance().then((prefs) {
            prefs.clear();
          });
          // context.read<FoodConsumingNotifier>().addMockFoodConsuming();
          // context.read<WaterConsumingNotifier>().addMockWaterConsuming();
        },
        child: const Icon(CupertinoIcons.clear),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Text('${date.day} ${date.month}', style: AppTextStyle.s20w700),
            SizedBox(
              width: 40,
              child: IconButton(
                onPressed: () =>
                    showAppTimePicker(context: context, child: BaseAppDatePicker(initialDate: date)).then((value) {
                  if (value != null) {
                    filterNotifier.setSelectedDate(value);
                    foodNotifier.getSortedConsumingsByDate(value);
                    waterNotifier.getSortedConsumingsByDate(value);
                  }
                }),
                icon: const Icon(CupertinoIcons.arrowtriangle_down_fill, color: AppColors.black),
                iconSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/topics_icon.png'),
            onPressed: () {}, //TODO
          ),
          IconButton(
            icon: Image.asset('assets/icons/settings_icon.png'),
            onPressed: () {}, //TODO
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const CalorieCounterCard(),
                  const WaterConsumingCard(),
                  const BodyParametersCard(),
                  const StatisticCard()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
