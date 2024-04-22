// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_parameters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BodyParametersModelImpl _$$BodyParametersModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BodyParametersModelImpl(
      weight: (json['weight'] as num?)?.toDouble(),
      height: json['height'] as int?,
      fatPercentage: json['fatPercentage'] as int?,
      calories: json['calories'] as int?,
      water: json['water'] as int?,
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
