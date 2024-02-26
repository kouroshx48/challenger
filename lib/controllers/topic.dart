import 'package:challenger/controllers/events/levelingevents.dart';
import 'package:challenger/controllers/leveling.dart';
import 'package:isar/isar.dart';

part 'topic.g.dart';
@embedded
class Topic{
  final String? name;
  @Name('topicLevel')
  final Leveling topicLeveling =Leveling(configer: 1);


  Topic({
    this.name,
  }) {
    topicLeveling.setLevelUpExp(50);
  }

  void addExpToTopic(int value) {
    // print('add exp to topic');
    int amount = value + topicLeveling.exp!;
    topicLeveling.setExp(amount);
    ExpIncreaseEvent(userLevelingObj: topicLeveling, configer: 1);
  }
  //add related skill to the list
  void addRelatedSkillToTopic(){}

}

