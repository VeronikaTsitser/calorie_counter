import 'package:calorie_counter/features/water_consuming/data/water_consuming_repository_impl.dart';
import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';
import 'package:flutter/cupertino.dart';

class WaterConsumingNotifier extends ChangeNotifier {
  WaterConsumingNotifier(this._waterConsumingRepository);
  final WaterConsumingRepositoryImpl _waterConsumingRepository;

  final List<WaterConsumingModel> _waterConsumingList = [];
  List<WaterConsumingModel> get waterConsumingList => _waterConsumingList;

  Future<void> addWaterConsuming({
    required String drinkName,
    required int waterConsuming,
    required DateTime lastWaterConsumingTime,
  }) async {
    _waterConsumingList.add(WaterConsumingModel(
      name: drinkName,
      consumedWaterValue: waterConsuming,
      date: lastWaterConsumingTime,
    ));
    await _waterConsumingRepository.setWaterConsuming(_waterConsumingList);
    notifyListeners();
  }
}
