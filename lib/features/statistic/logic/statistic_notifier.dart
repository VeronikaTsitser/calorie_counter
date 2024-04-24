import 'dart:developer';

import 'package:calorie_counter/core/utils/utils.dart';
import 'package:calorie_counter/features/calorie_counter/domain/food_consuming_repository.dart';
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

  Future<void> init() async {
    await getTotalCaloriesForToday();
    await getTotalWater();
    notifyListeners();
  }

  Future<void> getTotalCalories() async {
    final consumedFood = await _foodConsumingRepository.getFoodConsuming();
    _totalCalories = 0;
    for (var food in consumedFood) {
      _totalCalories += food.calories;
    }
    log('Total calories: $_totalCalories');
    notifyListeners();
  }

  Future<void> getTotalCaloriesForToday() async {
    final consumedFood = await _foodConsumingRepository.getFoodConsuming();
    _totalCalories = 0;
    for (var food in consumedFood) {
      if (food.time.isAfter(DateTime.now().startOfDay)) {
        _totalCalories += food.calories;
      }
    }
    log('Total calories: $_totalCalories');
    notifyListeners();
  }

  Future<void> getTotalWater() async {
    final consumedWater = await _waterConsumingRepository.getWaterConsuming();
    _totalWater = 0;
    for (var water in consumedWater) {
      _totalWater += water.consumedWaterValue;
    }
    log('Total water: $_totalWater');
    notifyListeners();
  }
}
