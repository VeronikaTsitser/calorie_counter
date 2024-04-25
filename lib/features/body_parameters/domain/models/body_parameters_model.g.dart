// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_parameters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BodyParametersModelImpl _$$BodyParametersModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BodyParametersModelImpl(
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toInt(),
      fatPercentage: (json['fatPercentage'] as num?)?.toInt(),
      calories: (json['calories'] as num?)?.toInt(),
      water: (json['water'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BodyParametersModelImplToJson(
        _$BodyParametersModelImpl instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'fatPercentage': instance.fatPercentage,
      'calories': instance.calories,
      'water': instance.water,
    };
