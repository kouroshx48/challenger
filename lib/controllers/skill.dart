import 'package:challenger/controllers/events/levelingevents.dart';
import 'package:challenger/controllers/leveling.dart';
import 'package:challenger/controllers/topic.dart';
// import 'package:challenger/controllers/topic.dart';

class Skill {
  final String name;
  final String skillType;
  final Leveling _skillLeveling = Leveling(configer: 2);
  // final int expForTopics;
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
