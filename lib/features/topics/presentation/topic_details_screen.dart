import 'package:auto_route/auto_route.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/features/topics/domain/models/topic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class TopicDetailsScreen extends StatelessWidget {
  const TopicDetailsScreen({super.key, required this.topic});
  final TopicModel topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Container(
                      height: 150.h,
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(topic.path, fit: BoxFit.fitWidth)),
                  SizedBox(height: 20.h),
                  Text(topic.content, style: AppTextStyle.s16w400),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
