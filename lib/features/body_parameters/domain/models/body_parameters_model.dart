import 'package:freezed_annotation/freezed_annotation.dart';

part 'body_parameters_model.freezed.dart';
part 'body_parameters_model.g.dart';

@freezed
class BodyParametersModel with _$BodyParametersModel {
  factory BodyParametersModel({
    double? weight,
    int? height,
    int? fatPercentage,
    int? calories,
    int? water,
  }) = _BodyParametersModel;

  factory BodyParametersModel.fromJson(Map<String, dynamic> json) => _$BodyParametersModelFromJson(json);
}
