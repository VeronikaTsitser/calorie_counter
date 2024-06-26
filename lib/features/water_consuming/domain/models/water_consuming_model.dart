import 'package:freezed_annotation/freezed_annotation.dart';

part 'water_consuming_model.freezed.dart';
part 'water_consuming_model.g.dart';

@freezed
class WaterConsumingModel with _$WaterConsumingModel {
  factory WaterConsumingModel({
    required int id,
    required String name,
    required int consumedWaterValue,
    required DateTime time,
  }) = _WaterConsumingModel;

  factory WaterConsumingModel.fromJson(Map<String, dynamic> json) => _$WaterConsumingModelFromJson(json);
}
