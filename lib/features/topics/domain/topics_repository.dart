import 'package:calorie_counter/features/topics/domain/models/topic_model.dart';

abstract class TopicsRepository {
  Future<List<TopicModel>> getTopics();
}
