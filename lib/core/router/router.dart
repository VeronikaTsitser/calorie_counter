import 'package:auto_route/auto_route.dart';
import 'package:calorie_counter/features/calorie_counter/presentation/food_consuming_details_screen.dart';
import 'package:calorie_counter/features/dash_board/presentation/dash_board_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashBoardRoute.page, initial: true),
        AutoRoute(page: FoodConsumingDetailsRoute.page),
      ];
}
