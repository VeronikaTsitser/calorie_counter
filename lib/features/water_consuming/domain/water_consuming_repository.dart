import 'package:calorie_counter/features/water_consuming/domain/models/water_consuming_model.dart';

abstract class WaterConsumingRepository {
  Future<void> setWaterConsuming(WaterConsumingModel waterConsuming);
  Future<WaterConsumingModel> getWaterConsuming();
}
