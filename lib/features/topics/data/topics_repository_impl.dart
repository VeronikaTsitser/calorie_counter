import 'dart:convert';

import 'package:calorie_counter/features/topics/domain/models/topic_model.dart';
import 'package:calorie_counter/features/topics/domain/topics_repository.dart';
import 'package:flutter/services.dart';

class TopicsRepositoryImpl implements TopicsRepository {
  @override
  Future<List<TopicModel>> getTopics() async {
    try {
      String jsonString = await rootBundle.loadString('assets/mock/mock_topics.json');
      final jsonResponse = jsonDecode(jsonString) as Map<String, dynamic>;
      List<TopicModel> topics = [];
      for (var json in jsonResponse['topics'] as List<dynamic>) {
        topics.add(TopicModel.fromJson(json));
      }
      return topics;
    } catch (e) {
      print('Ошибка при чтении файла: $e');
      return [];
    }
  }
}
