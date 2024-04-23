import 'dart:developer';

import 'package:calorie_counter/features/calorie_counter/domain/food_consuming_repository.dart';
import 'package:calorie_counter/features/calorie_counter/domain/models/food_consuming_model.dart';
import 'package:flutter/material.dart';

class FoodConsumingNotifier extends ChangeNotifier {
  FoodConsumingNotifier(this._foodConsumingRepository);
  final FoodConsumingRepository _foodConsumingRepository;

  final List<FoodConsumingModel> _foodConsumingList = [];
  List<FoodConsumingModel> get foodConsumingList => _foodConsumingList;

  Future<void> init() async {
    _foodConsumingList.clear();
    _foodConsumingList.addAll(await _foodConsumingRepository.getFoodConsuming());
    notifyListeners();
  }

  Future<void> addFoodConsuming({
    required String foodName,
    required int calories,
    required DateTime foodConsumingTime,
    String? composition,
    String? comment,
    double? cost,
  }) async {
    _foodConsumingList.add(FoodConsumingModel(
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
}
