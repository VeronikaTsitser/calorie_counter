import 'dart:developer';

import 'package:calorie_counter/features/calorie_counter/domain/food_consuming_repository.dart';
import 'package:calorie_counter/features/calorie_counter/domain/models/food_consuming_model.dart';
import 'package:flutter/material.dart';

class FoodConsumingDetailsNotifier extends ChangeNotifier {
  FoodConsumingDetailsNotifier(this._foodConsumingRepository);
  final FoodConsumingRepository _foodConsumingRepository;

  int _id = 0;
  int get id => _id;

  String _title = '';
  String get title => _title;
  void setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  int _calories = 0;
  int get calories => _calories;
  void setCalories(int value) {
    _calories = value;
    notifyListeners();
  }

  DateTime _foodConsumingTime = DateTime.now();
  DateTime get foodConsumingTime => _foodConsumingTime;
  void setFoodConsumingTime(DateTime value) {
    _foodConsumingTime = value;
    notifyListeners();
  }

  String? _composition = '';
  String? get composition => _composition;
  void setComposition(String? value) {
    _composition = value;
    notifyListeners();
  }

  String? _comment = '';
  String? get comment => _comment;
  void setComment(String? value) {
    _comment = value;
    notifyListeners();
  }

  double? _cost = 0.0;
  double? get cost => _cost;
  void setCost(double? value) {
    _cost = value;
    notifyListeners();
  }

  bool _isEditMode = false;
  bool get isEditMode => _isEditMode;
  void setEditMode(bool value) async {
    _isEditMode = value;
    notifyListeners();
  }

  Future<void> getFoodConsumingById(int id) async {
    final foodConsumingList = await _foodConsumingRepository.getFoodConsuming();
    final foodConsuming = foodConsumingList.firstWhere((element) => element.id == id);
    _title = foodConsuming.name;
    _calories = foodConsuming.calories;
    _foodConsumingTime = foodConsuming.time;
    _composition = foodConsuming.composition;
    _comment = foodConsuming.comment;
    _cost = foodConsuming.cost;
    _id = foodConsuming.id;
    notifyListeners();
  }

  Future<void> updateFoodConsuming() async {
    FoodConsumingModel foodConsuming = FoodConsumingModel(
      id: _id,
      name: _title,
      calories: _calories,
      time: _foodConsumingTime,
      composition: _composition,
      comment: _comment,
      cost: _cost,
    );
    final foodConsumingList = await _foodConsumingRepository.getFoodConsuming();
    final index = foodConsumingList.indexWhere((element) => element.id == _id);
    foodConsumingList[index] = foodConsuming;
    await _foodConsumingRepository.setFoodConsuming(foodConsumingList);
    log('Food consuming updated: $_title');
    _isEditMode = false;
    notifyListeners();
  }
}
