import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';
import 'package:calorie_counter/features/water_consuming/domain/water_consuming_repository.dart';
import 'package:flutter/cupertino.dart';

class WaterConsumingNotifier extends ChangeNotifier {
  WaterConsumingNotifier(this._waterConsumingRepository);
  final WaterConsumingRepository _waterConsumingRepository;

  List<WaterConsumingModel> _waterConsumingList = [];
  List<WaterConsumingModel> get waterConsumingList => _waterConsumingList;

  Future<void> init() async {
    getSortedConsumingsByDate(DateTime.now());
  }

  Future<void> getSortedConsumingsByDate(DateTime date) async {
    _waterConsumingList = await _waterConsumingRepository.getWaterConsuming();
    final sortedList = _waterConsumingList.where((element) {
      final isSameDay = element.time.day == date.day;
      final isSameMonth = element.time.month == date.month;
      final isSameYear = element.time.year == date.year;
      final result = isSameDay && isSameMonth && isSameYear;
      return result;
    }).toList();
    _waterConsumingList = sortedList;
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

  Future<void> addMockWaterConsuming() async {
    List<WaterConsumingModel> waterConsumingList = [
      WaterConsumingModel(
        id: 1,
        name: 'Water',
        consumedWaterValue: 200,
        time: DateTime(2024, 3, 28),
      ),
      WaterConsumingModel(
        id: 2,
        name: 'Tea',
        consumedWaterValue: 300,
        time: DateTime(2024, 4, 24),
      ),
      WaterConsumingModel(
        id: 3,
        name: 'Coffee',
        consumedWaterValue: 150,
        time: DateTime.now(),
      ),
    ];
    _waterConsumingList.addAll(waterConsumingList);
    await _waterConsumingRepository.setWaterConsuming(waterConsumingList);
    notifyListeners();
  }

  Future<void> deleteWaterConsuming(int id) async {
    _waterConsumingList.removeWhere((element) => element.id == id);
    await _waterConsumingRepository.setWaterConsuming(_waterConsumingList);
    notifyListeners();
  }
}
