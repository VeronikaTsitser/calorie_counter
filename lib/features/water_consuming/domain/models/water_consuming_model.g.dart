// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_consuming_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaterConsumingModelImpl _$$WaterConsumingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WaterConsumingModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      consumedWaterValue: json['consumedWaterValue'] as int,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$WaterConsumingModelImplToJson(
        _$WaterConsumingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'consumedWaterValue': instance.consumedWaterValue,
      'time': instance.time.toIso8601String(),
    };
