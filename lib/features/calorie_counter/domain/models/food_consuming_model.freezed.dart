// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_consuming_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodConsumingModel _$FoodConsumingModelFromJson(Map<String, dynamic> json) {
  return _FoodConsumingModel.fromJson(json);
}

/// @nodoc
mixin _$FoodConsumingModel {
  String get name => throw _privateConstructorUsedError;
  int get calories => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  String? get composition => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodConsumingModelCopyWith<FoodConsumingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodConsumingModelCopyWith<$Res> {
  factory $FoodConsumingModelCopyWith(
          FoodConsumingModel value, $Res Function(FoodConsumingModel) then) =
      _$FoodConsumingModelCopyWithImpl<$Res, FoodConsumingModel>;
  @useResult
  $Res call(
      {String name,
      int calories,
      DateTime time,
      String? composition,
      String? comment,
      double? cost});
}

/// @nodoc
class _$FoodConsumingModelCopyWithImpl<$Res, $Val extends FoodConsumingModel>
    implements $FoodConsumingModelCopyWith<$Res> {
  _$FoodConsumingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? calories = null,
    Object? time = null,
    Object? composition = freezed,
    Object? comment = freezed,
    Object? cost = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      composition: freezed == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodConsumingModelImplCopyWith<$Res>
    implements $FoodConsumingModelCopyWith<$Res> {
  factory _$$FoodConsumingModelImplCopyWith(_$FoodConsumingModelImpl value,
          $Res Function(_$FoodConsumingModelImpl) then) =
      __$$FoodConsumingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int calories,
      DateTime time,
      String? composition,
      String? comment,
      double? cost});
}

/// @nodoc
class __$$FoodConsumingModelImplCopyWithImpl<$Res>
    extends _$FoodConsumingModelCopyWithImpl<$Res, _$FoodConsumingModelImpl>
    implements _$$FoodConsumingModelImplCopyWith<$Res> {
  __$$FoodConsumingModelImplCopyWithImpl(_$FoodConsumingModelImpl _value,
      $Res Function(_$FoodConsumingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? calories = null,
    Object? time = null,
    Object? composition = freezed,
    Object? comment = freezed,
    Object? cost = freezed,
  }) {
    return _then(_$FoodConsumingModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      composition: freezed == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodConsumingModelImpl implements _FoodConsumingModel {
  _$FoodConsumingModelImpl(
      {required this.name,
      required this.calories,
      required this.time,
      this.composition,
      this.comment,
      this.cost});

  factory _$FoodConsumingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodConsumingModelImplFromJson(json);

  @override
  final String name;
  @override
  final int calories;
  @override
  final DateTime time;
  @override
  final String? composition;
  @override
  final String? comment;
  @override
  final double? cost;

  @override
  String toString() {
    return 'FoodConsumingModel(name: $name, calories: $calories, time: $time, composition: $composition, comment: $comment, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodConsumingModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.composition, composition) ||
                other.composition == composition) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, calories, time, composition, comment, cost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodConsumingModelImplCopyWith<_$FoodConsumingModelImpl> get copyWith =>
      __$$FoodConsumingModelImplCopyWithImpl<_$FoodConsumingModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodConsumingModelImplToJson(
      this,
    );
  }
}

abstract class _FoodConsumingModel implements FoodConsumingModel {
  factory _FoodConsumingModel(
      {required final String name,
      required final int calories,
      required final DateTime time,
      final String? composition,
      final String? comment,
      final double? cost}) = _$FoodConsumingModelImpl;

  factory _FoodConsumingModel.fromJson(Map<String, dynamic> json) =
      _$FoodConsumingModelImpl.fromJson;

  @override
  String get name;
  @override
  int get calories;
  @override
  DateTime get time;
  @override
  String? get composition;
  @override
  String? get comment;
  @override
  double? get cost;
  @override
  @JsonKey(ignore: true)
  _$$FoodConsumingModelImplCopyWith<_$FoodConsumingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
