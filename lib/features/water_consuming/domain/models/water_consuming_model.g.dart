// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_consuming_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaterConsumingModelImpl _$$WaterConsumingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WaterConsumingModelImpl(
      name: json['name'] as String,
      consumedWaterValue: json['consumedWaterValue'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$WaterConsumingModelImplToJson(
        _$WaterConsumingModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'consumedWaterValue': instance.consumedWaterValue,
      'date': instance.date.toIso8601String(),
    };
