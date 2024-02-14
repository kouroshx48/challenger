import 'package:challenger/controllers/events/levelingevents.dart';
import 'package:challenger/controllers/leveling.dart';
import 'package:challenger/controllers/topic.dart';
import 'package:hive_flutter/adapters.dart';
part 'skill.g.dart';
// import 'package:challenger/controllers/topic.dart';
@HiveType(typeId: 3, adapterName: 'SkillAdapter')
class Skill {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String skillType;
  @HiveField(2)
  final Leveling _skillLeveling = Leveling(configer: 2);
  // final int expForTopics;
  @HiveField(3)
  final List<Topic>? relatedTopics;

  Skill({
    required this.name,
    required this.skillType,
    this.relatedTopics,
  });

  Leveling get getSkillLevelingObj => _skillLeveling;
  String get getSkillType => skillType;

  void addExpToSkill(int value) {
    int amount = value + getSkillLevelingObj.getExp;
    getSkillLevelingObj.setExp(amount);
    ExpIncreaseEvent(object: this,userLevelingObj: getSkillLevelingObj, configer: 2);
  }

  // void addRelatedTopic(Topic topic) {
  //   relatedTopics?.add(topic);
  // }
  //
  // void addExpToRelatedTopics() {
  //   for (Topic topic in relatedTopics!) {
  //     topic.addExpToTopic(expForTopics);
  //   }
  // }
}
