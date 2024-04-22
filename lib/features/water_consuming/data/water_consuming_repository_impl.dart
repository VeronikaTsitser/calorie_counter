import 'dart:convert';
import 'dart:developer';

import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';
import 'package:calorie_counter/features/water_consuming/domain/water_consuming_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WaterConsumingRepositoryImpl implements WaterConsumingRepository {
  @override
  Future<WaterConsumingModel> getWaterConsuming() async {
    final pref = await SharedPreferences.getInstance();
    final waterConsuming = pref.getString('waterConsuming') ?? '';
    log('waterConsuming: $waterConsuming');
    return WaterConsumingModel.fromJson(jsonDecode(waterConsuming));
  }

  @override
  Future<void> setWaterConsuming(WaterConsumingModel waterConsuming) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('waterConsuming', jsonEncode(waterConsuming.toJson()));
  }
}
