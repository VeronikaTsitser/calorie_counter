import 'dart:convert';
import 'dart:developer';

import 'package:calorie_counter/features/calorie_counter/domain/food_consuming_repository.dart';
import 'package:calorie_counter/features/calorie_counter/domain/models/food_consuming_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodConsumingRepositoryImpl implements FoodConsumingRepository {
  @override
  Future<List<FoodConsumingModel>> getFoodConsuming() async {
    final pref = await SharedPreferences.getInstance();

    final foodConsumingList = pref.getStringList('foodConsumingList') ?? [];

    log('foodConsumingList: $foodConsumingList');
    List<FoodConsumingModel> sortedList = [];
    foodConsumingList.map((e) {
      sortedList.add(FoodConsumingModel.fromJson(jsonDecode(e)));
      return sortedList;
    }).toList();
    return sortedList;
  }

  @override
  Future<void> setFoodConsuming(List<FoodConsumingModel> foodConsumingList) async {
    final pref = await SharedPreferences.getInstance();
    foodConsumingList.sort((a, b) => a.time.compareTo(b.time));
    await pref.setStringList('foodConsumingList', foodConsumingList.map((e) => jsonEncode(e)).toList());
  }
}
