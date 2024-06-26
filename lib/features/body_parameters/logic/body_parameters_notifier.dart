import 'package:calorie_counter/features/body_parameters/domain/body_parameters_repository.dart';
import 'package:calorie_counter/features/body_parameters/domain/models/body_parameters_model.dart';
import 'package:flutter/material.dart';

class BodyParameterNotifier extends ChangeNotifier {
  final BodyParametersRepository bodyParametersRepository;
  bool isInitialized = false;

  BodyParameterNotifier(this.bodyParametersRepository);

  Future<void> init() async {
    final value = await bodyParametersRepository.getBodyParameter();
    _weight = value.weight;
    _height = value.height;
    _fatPercentage = value.fatPercentage;
    _calories = value.calories;
    _water = value.water;
    if (_weight == null && _height == null && _fatPercentage == null && _calories == null && _water == null) {
      _isEditMode = true;
    }
    isInitialized = true;
    notifyListeners();
  }

  Future<void> saveBodyParameters() async {
    await bodyParametersRepository.setBodyParameters(
      BodyParametersModel(
        weight: _weight,
        height: _height,
        fatPercentage: _fatPercentage,
        calories: _calories,
        water: _water,
      ),
    );
    _isEditMode = false;
    notifyListeners();
  }

  Future<void> clearBodyParameters() async {
    _weight = null;
    _height = null;
    _fatPercentage = null;
    _calories = null;
    _water = null;
    await bodyParametersRepository.setBodyParameters(
      BodyParametersModel(
        weight: _weight,
        height: _height,
        fatPercentage: _fatPercentage,
        calories: _calories,
        water: _water,
      ),
    );
    _isEditMode = true;
    notifyListeners();
  }

  bool _isEditMode = false;

  bool get isEditMode => _isEditMode;
  void setEditMode(bool value) {
    _isEditMode = value;
    notifyListeners();
  }

  double? _weight;

  double? get weight => _weight;

  void setWeight(double? value) {
    _weight = value;
    notifyListeners();
  }

  int? _height;

  int? get height => _height;

  void setHeight(int? value) {
    _height = value;
    notifyListeners();
  }

  int? _fatPercentage;

  int? get fatPercentage => _fatPercentage;

  void setFatPercentage(int? value) {
    _fatPercentage = value;
    notifyListeners();
  }

  int? _calories;

  int? get calories => _calories;

  void setCalories(int? value) {
    _calories = value;
    notifyListeners();
  }

  int? _water;

  int? get water => _water;

  void setWater(int? value) {
    _water = value;
    notifyListeners();
  }
}
