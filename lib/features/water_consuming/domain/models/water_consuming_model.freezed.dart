// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_consuming_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WaterConsumingModel _$WaterConsumingModelFromJson(Map<String, dynamic> json) {
  return _WaterConsumingModel.fromJson(json);
}

/// @nodoc
mixin _$WaterConsumingModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get consumedWaterValue => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WaterConsumingModelCopyWith<WaterConsumingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaterConsumingModelCopyWith<$Res> {
  factory $WaterConsumingModelCopyWith(
          WaterConsumingModel value, $Res Function(WaterConsumingModel) then) =
      _$WaterConsumingModelCopyWithImpl<$Res, WaterConsumingModel>;
  @useResult
  $Res call({int id, String name, int consumedWaterValue, DateTime time});
}

/// @nodoc
class _$WaterConsumingModelCopyWithImpl<$Res, $Val extends WaterConsumingModel>
    implements $WaterConsumingModelCopyWith<$Res> {
  _$WaterConsumingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? consumedWaterValue = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      consumedWaterValue: null == consumedWaterValue
          ? _value.consumedWaterValue
          : consumedWaterValue // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaterConsumingModelImplCopyWith<$Res>
    implements $WaterConsumingModelCopyWith<$Res> {
  factory _$$WaterConsumingModelImplCopyWith(_$WaterConsumingModelImpl value,
          $Res Function(_$WaterConsumingModelImpl) then) =
      __$$WaterConsumingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int consumedWaterValue, DateTime time});
}

/// @nodoc
class __$$WaterConsumingModelImplCopyWithImpl<$Res>
    extends _$WaterConsumingModelCopyWithImpl<$Res, _$WaterConsumingModelImpl>
    implements _$$WaterConsumingModelImplCopyWith<$Res> {
  __$$WaterConsumingModelImplCopyWithImpl(_$WaterConsumingModelImpl _value,
      $Res Function(_$WaterConsumingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? consumedWaterValue = null,
    Object? time = null,
  }) {
    return _then(_$WaterConsumingModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      consumedWaterValue: null == consumedWaterValue
          ? _value.consumedWaterValue
          : consumedWaterValue // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaterConsumingModelImpl implements _WaterConsumingModel {
  _$WaterConsumingModelImpl(
      {required this.id,
      required this.name,
      required this.consumedWaterValue,
      required this.time});

  factory _$WaterConsumingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaterConsumingModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int consumedWaterValue;
  @override
  final DateTime time;

  @override
  String toString() {
    return 'WaterConsumingModel(id: $id, name: $name, consumedWaterValue: $consumedWaterValue, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaterConsumingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.consumedWaterValue, consumedWaterValue) ||
                other.consumedWaterValue == consumedWaterValue) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, consumedWaterValue, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WaterConsumingModelImplCopyWith<_$WaterConsumingModelImpl> get copyWith =>
      __$$WaterConsumingModelImplCopyWithImpl<_$WaterConsumingModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaterConsumingModelImplToJson(
      this,
    );
  }
}

abstract class _WaterConsumingModel implements WaterConsumingModel {
  factory _WaterConsumingModel(
      {required final int id,
      required final String name,
      required final int consumedWaterValue,
      required final DateTime time}) = _$WaterConsumingModelImpl;

  factory _WaterConsumingModel.fromJson(Map<String, dynamic> json) =
      _$WaterConsumingModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get consumedWaterValue;
  @override
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$$WaterConsumingModelImplCopyWith<_$WaterConsumingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
