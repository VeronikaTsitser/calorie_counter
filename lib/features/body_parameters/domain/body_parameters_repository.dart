import 'package:calorie_counter/features/body_parameters/domain/models/body_parameters_model.dart';

abstract class BodyParametersRepository {
  Future<void> setBodyParameters(BodyParametersModel bodyParameters);
  Future<BodyParametersModel> getBodyParameter();
}
