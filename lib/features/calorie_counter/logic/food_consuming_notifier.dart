import 'dart:developer';

import 'package:calorie_counter/features/calorie_counter/domain/food_consuming_repository.dart';
import 'package:calorie_counter/features/calorie_counter/domain/models/food_consuming_model.dart';
import 'package:flutter/material.dart';

class FoodConsumingNotifier extends ChangeNotifier {
  FoodConsumingNotifier(this._foodConsumingRepository);
  final FoodConsumingRepository _foodConsumingRepository;

  List<FoodConsumingModel> _foodConsumingList = [];
  List<FoodConsumingModel> get foodConsumingList => _foodConsumingList;
  void setFoodConsumingList(List<FoodConsumingModel> value) {
    _foodConsumingList = value;
    notifyListeners();
  }

  Future<void> init() async {
    await getSortedConsumingsByDate(DateTime.now());
  }

  Future<void> getSortedConsumingsByDate(DateTime date) async {
    _foodConsumingList = await _foodConsumingRepository.getFoodConsuming();
    final sortedList = _foodConsumingList.where((element) {
      final isSameDay = element.time.day == date.day;
      final isSameMonth = element.time.month == date.month;
      final isSameYear = element.time.year == date.year;
      final result = isSameDay && isSameMonth && isSameYear;
      return result;
    }).toList();
    _foodConsumingList = sortedList;
    notifyListeners();
  }

  Future<void> addFoodConsuming({
    required int id,
    required String foodName,
    required int calories,
    required DateTime foodConsumingTime,
    String? composition,
    String? comment,
    double? cost,
  }) async {
    _foodConsumingList.add(FoodConsumingModel(
      id: id,
      name: foodName,
      calories: calories,
      time: foodConsumingTime,
      composition: composition,
      comment: comment,
      cost: cost,
    ));
    await _foodConsumingRepository.setFoodConsuming(_foodConsumingList);
    log('Food consuming added: $foodName');
    notifyListeners();
  }

  Future<void> deleteFoodConsuming(int id) async {
    _foodConsumingList.removeWhere((element) => element.id == id);
    await _foodConsumingRepository.setFoodConsuming(_foodConsumingList);
    notifyListeners();
  }

  Future<void> addMockFoodConsuming() async {
    List<FoodConsumingModel> foodConsumingList = [
      FoodConsumingModel(
        id: 1,
        name: 'Apple',
        calories: 52,
        time: DateTime(2024, 3, 28),
        composition: 'Apple',
        comment: 'Good for health',
        cost: 0.5,
      ),
      FoodConsumingModel(
        id: 2,
        name: 'Banana',
        calories: 89,
        time: DateTime(2024, 4, 24),
        composition: 'Banana',
        comment: 'Good for health',
        cost: 0.5,
      ),
      FoodConsumingModel(
        id: 3,
        name: 'Orange',
        calories: 62,
        time: DateTime.now(),
        composition: 'Orange',
        comment: 'Good for health',
        cost: 0.5,
      ),
    ];
    await _foodConsumingRepository.setFoodConsuming(foodConsumingList);
    notifyListeners();
  }
}
