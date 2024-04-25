// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calorie_counter/features/topics/domain/models/topic_model.dart';
import 'package:calorie_counter/features/topics/domain/topics_repository.dart';
import 'package:flutter/cupertino.dart';

class TopicsNotifier extends ChangeNotifier {
  TopicsNotifier(this._topicsRepository);
  final TopicsRepository _topicsRepository;

  List<TopicModel> _topicsList = [];
  List<TopicModel> get topicsList => _topicsList;

  Future<void> getTopics() async {
    _topicsList = await _topicsRepository.getTopics();
    notifyListeners();
  }
}
