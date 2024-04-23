import 'dart:convert';
import 'dart:developer';

import 'package:calorie_counter/features/calorie_counter/domain/food_consuming_repository.dart';
import 'package:calorie_counter/features/calorie_counter/domain/models/food_consuming_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodConsumingRepositoryImpl implements FoodConsumingRepository {
  @override
  Future<List<FoodConsumingModel>> getCalorieCounters() async {
    final pref = await SharedPreferences.getInstance();
    final foodConsumingList = pref.getStringList('foodConsumingList') ?? [];
    log('foodConsumingList: $foodConsumingList');
    return foodConsumingList.map((e) => FoodConsumingModel.fromJson(jsonDecode(e))).toList();
  }

  @override
  Future<void> setCalorieCounters(List<FoodConsumingModel> foodConsumingList) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setStringList('foodConsumingList', foodConsumingList.map((e) => jsonEncode(e)).toList());
  }
}
