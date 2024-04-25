import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_model.freezed.dart';
part 'topic_model.g.dart';

@freezed
class TopicModel with _$TopicModel {
  factory TopicModel({
    required String title,
    required String content,
    required String path,
  }) = _TopicModel;

  factory TopicModel.fromJson(Map<String, dynamic> json) => _$TopicModelFromJson(json);
}
