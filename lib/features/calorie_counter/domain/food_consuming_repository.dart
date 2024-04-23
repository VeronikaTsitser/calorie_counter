import 'package:calorie_counter/features/calorie_counter/domain/models/food_consuming_model.dart';

abstract class FoodConsumingRepository {
  Future<List<FoodConsumingModel>> getCalorieCounters();
  Future<void> setCalorieCounters(List<FoodConsumingModel> foodConsumingList);
}
