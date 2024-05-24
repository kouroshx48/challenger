import 'package:challenger/controllers/daily_quest.dart';
import 'package:challenger/controllers/topic.dart';
import 'package:isar/isar.dart';

part 'challenge.g.dart';

@embedded
class Challenge {
  String? name;
  int? days;
  DateTime? startDate;
  List<Topic> relatedTopics = [];
  int? goal;
  List<DailyQuest> dailySteps = [];
}
