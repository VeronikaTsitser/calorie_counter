import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';
import 'package:calorie_counter/features/water_consuming/domain/water_consuming_repository.dart';
import 'package:flutter/cupertino.dart';

class WaterConsumingNotifier extends ChangeNotifier {
  WaterConsumingNotifier(this._waterConsumingRepository);
  final WaterConsumingRepository _waterConsumingRepository;

  final List<WaterConsumingModel> _waterConsumingList = [];
  List<WaterConsumingModel> get waterConsumingList => _waterConsumingList;

  Future<void> init() async {
    _waterConsumingList.clear();
    _waterConsumingList.addAll(await _waterConsumingRepository.getWaterConsuming());
    notifyListeners();
  }

  Future<void> addWaterConsuming({
    required String drinkName,
    required int waterConsuming,
    required DateTime lastWaterConsumingTime,
    required int id,
  }) async {
    _waterConsumingList.add(WaterConsumingModel(
      id: id,
      name: drinkName,
      consumedWaterValue: waterConsuming,
      time: lastWaterConsumingTime,
    ));
    await _waterConsumingRepository.setWaterConsuming(_waterConsumingList);
    notifyListeners();
  }
}
