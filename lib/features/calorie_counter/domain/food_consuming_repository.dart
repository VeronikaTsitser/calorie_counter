import 'package:calorie_counter/features/calorie_counter/domain/models/food_consuming_model.dart';

abstract class FoodConsumingRepository {
  Future<List<FoodConsumingModel>> getFoodConsuming();
  Future<void> setFoodConsuming(List<FoodConsumingModel> foodConsumingList);
}
