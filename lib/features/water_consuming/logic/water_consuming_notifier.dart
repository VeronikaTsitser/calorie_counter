import 'package:calorie_counter/features/water_consuming/data/water_consuming_repository_impl.dart';
import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';
import 'package:flutter/cupertino.dart';

class WaterConsumingNotifier extends ChangeNotifier {
  WaterConsumingNotifier(this._waterConsumingRepository);
  final WaterConsumingRepositoryImpl _waterConsumingRepository;

  void addWaterConsuming() {
    _waterConsumingRepository.setWaterConsuming(WaterConsumingModel(
      name: _drinkName,
      consumedWaterValue: _waterConsuming,
      date: _lastWaterConsumingTime,
    ));
    notifyListeners();
  }

  int _waterConsuming = 0;
  int get waterConsuming => _waterConsuming;
  void setWaterConsuming(int value) => _waterConsuming = value;

  DateTime _lastWaterConsumingTime = DateTime.now();
  DateTime get lastWaterConsumingTime => _lastWaterConsumingTime;
  void setLastWaterConsumingTime(DateTime value) => _lastWaterConsumingTime = value;

  String _drinkName = '';
  String get drinkName => _drinkName;
  void setDrinkName(String value) => _drinkName = value;
}
