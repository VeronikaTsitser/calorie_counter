import 'package:auto_route/auto_route.dart';
import 'package:calorie_counter/features/calorie_counter/presentation/food_consuming_details_screen.dart';
import 'package:calorie_counter/features/dash_board/presentation/dash_board_screen.dart';
import 'package:calorie_counter/features/loading/loading_screen.dart';
import 'package:calorie_counter/features/onboarding/presentation/onboarding_screen.dart';
import 'package:calorie_counter/features/settings/presentation/appeal_screen.dart';
import 'package:calorie_counter/features/settings/presentation/settings_screen.dart';
import 'package:calorie_counter/features/topics/presentation/topic_details_screen.dart';
import 'package:calorie_counter/features/topics/presentation/topics_list_screen.dart';
import 'package:calorie_counter/features/water_consuming/presentation/water_consuming_details_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoadingRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: DashBoardRoute.page),
        AutoRoute(page: FoodConsumingDetailsRoute.page),
        AutoRoute(page: WaterConsumingDetailsRoute.page),
        AutoRoute(page: TopicsListRoute.page),
        AutoRoute(page: TopicDetailsRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: AppealRoute.page),
      ];
}
