// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_consuming_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodConsumingModelImpl _$$FoodConsumingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FoodConsumingModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      calories: (json['calories'] as num).toInt(),
      time: DateTime.parse(json['time'] as String),
      composition: json['composition'] as String?,
      comment: json['comment'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FoodConsumingModelImplToJson(
        _$FoodConsumingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'calories': instance.calories,
      'time': instance.time.toIso8601String(),
      'composition': instance.composition,
      'comment': instance.comment,
      'cost': instance.cost,
    };
