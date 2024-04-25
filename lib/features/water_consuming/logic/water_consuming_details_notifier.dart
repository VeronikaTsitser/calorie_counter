import 'dart:developer';

import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';
import 'package:calorie_counter/features/water_consuming/domain/water_consuming_repository.dart';
import 'package:flutter/material.dart';

class WaterConsumingDetailsNotifier extends ChangeNotifier {
  WaterConsumingDetailsNotifier(this._waterConsumingRepository);
  final WaterConsumingRepository _waterConsumingRepository;

  final int _id = 0;
  int get id => _id;

  String _title = '';
  String get title => _title;
  void setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  int _waterConsuming = 0;
  int get waterConsuming => _waterConsuming;
  void setWaterConsuming(int value) {
    _waterConsuming = value;
    notifyListeners();
  }

  DateTime _waterConsumingTime = DateTime.now();
  DateTime get waterConsumingTime => _waterConsumingTime;
  void setWaterConsumingTime(DateTime value) {
    _waterConsumingTime = value;
    notifyListeners();
  }

  bool _isEditMode = false;
  bool get isEditMode => _isEditMode;
  void setEditMode(bool value) {
    _isEditMode = value;
    notifyListeners();
  }

  Future<void> getWaterConsumingById(int id) async {
    final waterConsumingList = await _waterConsumingRepository.getWaterConsuming();
    final waterConsuming = waterConsumingList.firstWhere((element) => element.id == id);
    _title = waterConsuming.name;
    _waterConsuming = waterConsuming.consumedWaterValue;
    _waterConsumingTime = waterConsuming.time;
    notifyListeners();
  }

  Future<void> updateWaterConsuming() async {
    final updatedConsuming = WaterConsumingModel(
      id: _id,
      name: _title,
      consumedWaterValue: _waterConsuming,
      time: _waterConsumingTime,
    );
    final waterConsumingList = await _waterConsumingRepository.getWaterConsuming();
    final index = waterConsumingList.indexWhere((element) => element.id == _id);
    waterConsumingList[index] = updatedConsuming;

    await _waterConsumingRepository.setWaterConsuming(waterConsumingList);
    log('WaterConsumingDetailsNotifier.updateWaterConsuming: $waterConsumingList');
    _isEditMode = false;
    notifyListeners();
  }
}
