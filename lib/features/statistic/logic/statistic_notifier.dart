import 'dart:developer';

import 'package:calorie_counter/core/utils/utils.dart';
import 'package:calorie_counter/features/calorie_counter/domain/food_consuming_repository.dart';
import 'package:calorie_counter/features/calorie_counter/domain/models/food_consuming_model.dart';
import 'package:calorie_counter/features/statistic/domain/enum.dart';
import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';
import 'package:calorie_counter/features/water_consuming/domain/water_consuming_repository.dart';
import 'package:flutter/material.dart';

class StatisticNotifier extends ChangeNotifier {
  StatisticNotifier(this._foodConsumingRepository, this._waterConsumingRepository);
  final FoodConsumingRepository _foodConsumingRepository;
  final WaterConsumingRepository _waterConsumingRepository;

  int _totalCalories = 0;
  int get totalCalories => _totalCalories;

  int _totalWater = 0;
  int get totalWater => _totalWater;

  TimePeriodEnum _timePeriodEnum = TimePeriodEnum.today;
  TimePeriodEnum get timePeriodEnum => _timePeriodEnum;
  Future<void> setTimePeriod(TimePeriodEnum timePeriodEnum) async {
    _timePeriodEnum = timePeriodEnum;
    await getTotalCalories();
    await getTotalWater();
    notifyListeners();
  }

  Future<void> init() async {
    await getTotalCalories();
    await getTotalWater();
    notifyListeners();
  }

  Future<void> saveWaterAndFood() async {
    await _foodConsumingRepository.setFoodConsuming([
      FoodConsumingModel(
        name: 'Картошка',
        calories: 100,
        time: DateTime(2024, 3, 28),
      ),
      FoodConsumingModel(
        name: 'Морковка',
        calories: 50,
        time: DateTime(2024, 4, 20),
      ),
      FoodConsumingModel(
        name: 'Салат',
        calories: 30,
        time: DateTime(2024, 4, 24, 7),
      ),
    ]);
    await _waterConsumingRepository.setWaterConsuming([
      WaterConsumingModel(
        name: 'Вода',
        consumedWaterValue: 200,
        time: DateTime(2024, 3, 28),
      ),
      WaterConsumingModel(
        name: 'Вода',
        consumedWaterValue: 200,
        time: DateTime(2024, 4, 20),
      ),
      WaterConsumingModel(
        name: 'Вода',
        consumedWaterValue: 200,
        time: DateTime(2024, 4, 24, 7),
      ),
    ]);
  }

  Future<void> getTotalCalories() async {
    final consumedFood = await _foodConsumingRepository.getFoodConsuming();
    _totalCalories = 0;
    if (_timePeriodEnum == TimePeriodEnum.today) {
      for (var food in consumedFood) {
        if (food.time.isAfter(DateTime.now().startOfDay)) {
          _totalCalories += food.calories;
        }
      }
    } else if (_timePeriodEnum == TimePeriodEnum.week) {
      for (var food in consumedFood) {
        if (food.time.isAfter(DateTime.now().dateWeekAgo)) {
          _totalCalories += food.calories;
        }
      }
    } else if (_timePeriodEnum == TimePeriodEnum.month) {
      for (var food in consumedFood) {
        if (food.time.isAfter(DateTime.now().dateMonthAgo)) {
          _totalCalories += food.calories;
        }
      }
    }
    log('Total calories: $_totalCalories');
    notifyListeners();
  }

  Future<void> getTotalWater() async {
    final consumedWater = await _waterConsumingRepository.getWaterConsuming();
    _totalWater = 0;
    switch (_timePeriodEnum) {
      case TimePeriodEnum.today:
        for (var water in consumedWater) {
          if (water.time.isAfter(DateTime.now().startOfDay)) {
            _totalWater += water.consumedWaterValue;
          }
        }

        break;
      case TimePeriodEnum.week:
        for (var water in consumedWater) {
          if (water.time.isAfter(DateTime.now().dateWeekAgo)) {
            _totalWater += water.consumedWaterValue;
          }
        }
        break;
      case TimePeriodEnum.month:
        for (var water in consumedWater) {
          if (water.time.isAfter(DateTime.now().dateMonthAgo)) {
            _totalWater += water.consumedWaterValue;
          }
        }
        break;
    }
    log('Total water: $_totalWater');
    notifyListeners();
  }
}
