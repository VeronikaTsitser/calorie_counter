import 'dart:convert';
import 'dart:developer';

import 'package:calorie_counter/features/body_parameters/domain/body_parameters_repository.dart';
import 'package:calorie_counter/features/body_parameters/domain/models/body_parameters_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyParametersRepositoryImpl implements BodyParametersRepository {
  @override
  Future<BodyParametersModel> getBodyParameter() async {
    final preferences = await SharedPreferences.getInstance();
    final bodyParameters = preferences.getString('bodyParameters') ?? '';
    log('bodyParameters: $bodyParameters');
    return BodyParametersModel.fromJson(jsonDecode(bodyParameters));
  }

  @override
  Future<void> setBodyParameters(BodyParametersModel bodyParameters) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('bodyParameters', jsonEncode(bodyParameters.toJson()));
  }
}
