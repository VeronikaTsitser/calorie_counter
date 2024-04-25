// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppealRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppealScreen(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashBoardScreen(),
      );
    },
    FoodConsumingDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FoodConsumingDetailsScreen(),
      );
    },
    LoadingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoadingScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    TopicDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TopicDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TopicDetailsScreen(
          key: args.key,
          topic: args.topic,
        ),
      );
    },
    TopicsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TopicsListScreen(),
      );
    },
    WaterConsumingDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WaterConsumingDetailsScreen(),
      );
    },
  };
}

/// generated route for
/// [AppealScreen]
class AppealRoute extends PageRouteInfo<void> {
  const AppealRoute({List<PageRouteInfo>? children})
      : super(
          AppealRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppealRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashBoardScreen]
class DashBoardRoute extends PageRouteInfo<void> {
  const DashBoardRoute({List<PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FoodConsumingDetailsScreen]
class FoodConsumingDetailsRoute extends PageRouteInfo<void> {
  const FoodConsumingDetailsRoute({List<PageRouteInfo>? children})
      : super(
          FoodConsumingDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodConsumingDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TopicDetailsScreen]
class TopicDetailsRoute extends PageRouteInfo<TopicDetailsRouteArgs> {
  TopicDetailsRoute({
    Key? key,
    required TopicModel topic,
    List<PageRouteInfo>? children,
  }) : super(
          TopicDetailsRoute.name,
          args: TopicDetailsRouteArgs(
            key: key,
            topic: topic,
          ),
          initialChildren: children,
        );

  static const String name = 'TopicDetailsRoute';

  static const PageInfo<TopicDetailsRouteArgs> page =
      PageInfo<TopicDetailsRouteArgs>(name);
}

class TopicDetailsRouteArgs {
  const TopicDetailsRouteArgs({
    this.key,
    required this.topic,
  });

  final Key? key;

  final TopicModel topic;

  @override
  String toString() {
    return 'TopicDetailsRouteArgs{key: $key, topic: $topic}';
  }
}

/// generated route for
/// [TopicsListScreen]
class TopicsListRoute extends PageRouteInfo<void> {
  const TopicsListRoute({List<PageRouteInfo>? children})
      : super(
          TopicsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopicsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WaterConsumingDetailsScreen]
class WaterConsumingDetailsRoute extends PageRouteInfo<void> {
  const WaterConsumingDetailsRoute({List<PageRouteInfo>? children})
      : super(
          WaterConsumingDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WaterConsumingDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
