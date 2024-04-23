import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/features/body_parameters/data/body_parameters_repository_impl.dart';
import 'package:calorie_counter/features/body_parameters/domain/body_parameters_repository.dart';
import 'package:calorie_counter/features/body_parameters/logic/body_parameters_notifier.dart';
import 'package:calorie_counter/features/calorie_counter/data/food_consuming_repository_impl.dart';
import 'package:calorie_counter/features/calorie_counter/domain/food_consuming_repository.dart';
import 'package:calorie_counter/features/calorie_counter/logic/food_consuming_notifier.dart';
import 'package:calorie_counter/features/dash_board/presentation/dash_board_screen.dart';
import 'package:calorie_counter/features/statistic/logic/statistic_notifier.dart';
import 'package:calorie_counter/features/water_consuming/data/water_consuming_repository_impl.dart';
import 'package:calorie_counter/features/water_consuming/domain/water_consuming_repository.dart';
import 'package:calorie_counter/features/water_consuming/logic/water_consuming_notifier.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() => runApp(DevicePreview(enabled: kDebugMode, builder: (context) => const CalorieCounterApp()));

class CalorieCounterApp extends StatelessWidget {
  const CalorieCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: MaterialApp(
        theme: lightTheme,
        home: MultiProvider(
          providers: [
            RepositoryProvider<BodyParametersRepository>(create: (context) => BodyParametersRepositoryImpl()),
            RepositoryProvider<WaterConsumingRepository>(create: (context) => WaterConsumingRepositoryImpl()),
            RepositoryProvider<FoodConsumingRepository>(create: (context) => FoodConsumingRepositoryImpl()),
            ChangeNotifierProvider(
                create: (context) => WaterConsumingNotifier(context.read<WaterConsumingRepository>())..init()),
            ChangeNotifierProvider(
                create: (context) => BodyParameterNotifier(context.read<BodyParametersRepository>())..init()),
            ChangeNotifierProvider(
                create: (context) => FoodConsumingNotifier(context.read<FoodConsumingRepository>())..init()),
            ChangeNotifierProvider(
              create: (context) => StatisticNotifier(
                context.read<FoodConsumingRepository>(),
                context.read<WaterConsumingRepository>(),
              )..init(),
            ),
          ],
          child: const DashBoardScreen(),
        ),
      ),
    );
  }
}
