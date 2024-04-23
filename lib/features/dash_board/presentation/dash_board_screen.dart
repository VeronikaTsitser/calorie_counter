import 'package:calorie_counter/features/body_parameters/presentation/body_parameters_card.dart';
import 'package:calorie_counter/features/calorie_counter/presentation/calorie_counter_card.dart';
import 'package:calorie_counter/features/water_consuming/presentation/water_consuming_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Сегодня'),
            SizedBox(
              width: 40,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.arrowtriangle_down_fill),
                iconSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/topics_icon.png'),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/icons/settings_icon.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const CalorieCounterCard(),
                  const WaterConsumingCard(),
                  const BodyParametersCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
