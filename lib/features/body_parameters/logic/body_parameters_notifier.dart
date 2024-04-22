import 'package:calorie_counter/features/body_parameters/data/body_parameters_repository_impl.dart';
import 'package:calorie_counter/features/body_parameters/domain/models/body_parameters_model.dart';
import 'package:flutter/material.dart';

class BodyParameterNotifier extends ChangeNotifier {
  final BodyParametersRepositoryImpl repository;

  BodyParameterNotifier(this.repository);

  void setBodyParameters({
    double? weight,
    int? height,
    int? fatPercentage,
    int? calories,
    int? water,
  }) {
    repository.setBodyParameters(BodyParametersModel(
      weight: weight,
      height: height,
      fatPercentage: fatPercentage,
      calories: calories,
      water: water,
    ));
    notifyListeners();
  }

  Future<BodyParametersModel> getBodyParameters() async {
    final bodyParameters = await repository.getBodyParameter();
    return bodyParameters;
  }

  // void setWeight(double value) {
  //   weight = value;
  //   _preferences.setDouble('weight', value);
  //   notifyListeners();
  // }

  // void setHeight(double value) {
  //   height = value;
  //   _preferences.setDouble('height', value);
  //   notifyListeners();
  // }

  // void setFatPercentage(double value) {
  //   fatPercentage = value;
  //   _preferences.setDouble('fatPercentage', value);
  //   notifyListeners();
  // }

  // void setCalories(double value) {
  //   calories = value;
  //   _preferences.setDouble('calories', value);
  //   notifyListeners();
  // }

  // void setWater(double value) {
  //   water = value;
  //   _preferences.setDouble('water', value);
  //   notifyListeners();
  // }
}
