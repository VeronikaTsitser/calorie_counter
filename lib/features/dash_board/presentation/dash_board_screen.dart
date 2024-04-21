import 'package:calorie_counter/features/body_parameters/presentation/body_parameters_card.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сегодня'),
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
