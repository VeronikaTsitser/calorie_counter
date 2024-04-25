import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/router/router.dart';
import 'package:calorie_counter/features/topics/domain/models/topic_model.dart';
import 'package:calorie_counter/features/topics/logic/topics_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octo_image/octo_image.dart';

@RoutePage()
class TopicsListScreen extends StatelessWidget {
  const TopicsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<TopicsNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Интересное о питании'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 12),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => TopicsListCard(topic: notifier.topicsList[index]),
                childCount: notifier.topicsList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopicsListCard extends StatelessWidget {
  const TopicsListCard({super.key, required this.topic});

  final TopicModel topic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => AutoRouter.of(context).push(TopicDetailsRoute(topic: topic)),
        child: Container(
          height: 150.h,
          margin: const EdgeInsets.only(top: 12),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              OctoImage(
                image: AssetImage(topic.path),
                fit: BoxFit.fitWidth,
                fadeInCurve: Curves.easeInOut,
                fadeInDuration: const Duration(milliseconds: 500),
                placeholderBuilder: (context) => Container(color: Colors.white),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Stack(
                  children: [
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          color: Colors.black.withOpacity(0.1),
                          child: Text(
                            topic.title,
                            style: AppTextStyle.s20w700.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
