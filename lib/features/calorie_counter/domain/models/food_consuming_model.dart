import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_consuming_model.freezed.dart';
part 'food_consuming_model.g.dart';

@freezed
class FoodConsumingModel with _$FoodConsumingModel {
  factory FoodConsumingModel({
    required String name,
    required int calories,
    required DateTime time,
    String? composition,
    String? comment,
    double? cost,
  }) = _FoodConsumingModel;

  factory FoodConsumingModel.fromJson(Map<String, dynamic> json) => _$FoodConsumingModelFromJson(json);
}
