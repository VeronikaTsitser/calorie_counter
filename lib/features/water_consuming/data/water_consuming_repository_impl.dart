import 'dart:convert';
import 'dart:developer';

import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';
import 'package:calorie_counter/features/water_consuming/domain/water_consuming_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WaterConsumingRepositoryImpl implements WaterConsumingRepository {
  @override
  Future<List<WaterConsumingModel>> getWaterConsuming() async {
    final pref = await SharedPreferences.getInstance();
    final waterConsuming = pref.getStringList('waterConsuming') ?? [];
    log('waterConsuming: $waterConsuming');
    return waterConsuming.map((e) => WaterConsumingModel.fromJson(jsonDecode(e))).toList();
  }

  @override
  Future<void> setWaterConsuming(List<WaterConsumingModel> waterConsuming) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setStringList('waterConsuming', waterConsuming.map((e) => jsonEncode(e.toJson())).toList());
  }
}
