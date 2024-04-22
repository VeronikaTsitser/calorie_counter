// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'body_parameters_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BodyParametersModel _$BodyParametersModelFromJson(Map<String, dynamic> json) {
  return _BodyParametersModel.fromJson(json);
}

/// @nodoc
mixin _$BodyParametersModel {
  double? get weight => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get fatPercentage => throw _privateConstructorUsedError;
  int? get calories => throw _privateConstructorUsedError;
  int? get water => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BodyParametersModelCopyWith<BodyParametersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyParametersModelCopyWith<$Res> {
  factory $BodyParametersModelCopyWith(
          BodyParametersModel value, $Res Function(BodyParametersModel) then) =
      _$BodyParametersModelCopyWithImpl<$Res, BodyParametersModel>;
  @useResult
  $Res call(
      {double? weight,
      int? height,
      int? fatPercentage,
      int? calories,
      int? water});
}

/// @nodoc
class _$BodyParametersModelCopyWithImpl<$Res, $Val extends BodyParametersModel>
    implements $BodyParametersModelCopyWith<$Res> {
  _$BodyParametersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = freezed,
    Object? height = freezed,
    Object? fatPercentage = freezed,
    Object? calories = freezed,
    Object? water = freezed,
  }) {
    return _then(_value.copyWith(
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      fatPercentage: freezed == fatPercentage
          ? _value.fatPercentage
          : fatPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      water: freezed == water
          ? _value.water
          : water // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BodyParametersModelImplCopyWith<$Res>
    implements $BodyParametersModelCopyWith<$Res> {
  factory _$$BodyParametersModelImplCopyWith(_$BodyParametersModelImpl value,
          $Res Function(_$BodyParametersModelImpl) then) =
      __$$BodyParametersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? weight,
      int? height,
      int? fatPercentage,
      int? calories,
      int? water});
}

/// @nodoc
class __$$BodyParametersModelImplCopyWithImpl<$Res>
    extends _$BodyParametersModelCopyWithImpl<$Res, _$BodyParametersModelImpl>
    implements _$$BodyParametersModelImplCopyWith<$Res> {
  __$$BodyParametersModelImplCopyWithImpl(_$BodyParametersModelImpl _value,
      $Res Function(_$BodyParametersModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = freezed,
    Object? height = freezed,
    Object? fatPercentage = freezed,
    Object? calories = freezed,
    Object? water = freezed,
  }) {
    return _then(_$BodyParametersModelImpl(
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      fatPercentage: freezed == fatPercentage
          ? _value.fatPercentage
          : fatPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      water: freezed == water
          ? _value.water
          : water // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyParametersModelImpl implements _BodyParametersModel {
  _$BodyParametersModelImpl(
      {this.weight,
      this.height,
      this.fatPercentage,
      this.calories,
      this.water});

  factory _$BodyParametersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyParametersModelImplFromJson(json);

  @override
  final double? weight;
  @override
  final int? height;
  @override
  final int? fatPercentage;
  @override
  final int? calories;
  @override
  final int? water;

  @override
  String toString() {
    return 'BodyParametersModel(weight: $weight, height: $height, fatPercentage: $fatPercentage, calories: $calories, water: $water)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyParametersModelImpl &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.fatPercentage, fatPercentage) ||
                other.fatPercentage == fatPercentage) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.water, water) || other.water == water));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, weight, height, fatPercentage, calories, water);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyParametersModelImplCopyWith<_$BodyParametersModelImpl> get copyWith =>
      __$$BodyParametersModelImplCopyWithImpl<_$BodyParametersModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyParametersModelImplToJson(
      this,
    );
  }
}

abstract class _BodyParametersModel implements BodyParametersModel {
  factory _BodyParametersModel(
      {final double? weight,
      final int? height,
      final int? fatPercentage,
      final int? calories,
      final int? water}) = _$BodyParametersModelImpl;

  factory _BodyParametersModel.fromJson(Map<String, dynamic> json) =
      _$BodyParametersModelImpl.fromJson;

  @override
  double? get weight;
  @override
  int? get height;
  @override
  int? get fatPercentage;
  @override
  int? get calories;
  @override
  int? get water;
  @override
  @JsonKey(ignore: true)
  _$$BodyParametersModelImplCopyWith<_$BodyParametersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
