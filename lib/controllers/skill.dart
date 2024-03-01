import 'package:challenger/controllers/events/levelingevents.dart';
import 'package:challenger/controllers/leveling.dart';
import 'package:challenger/controllers/skill_timer.dart';
import 'package:challenger/controllers/topic.dart';
import 'package:isar/isar.dart';
part 'skill.g.dart';
// import 'package:challenger/controllers/topic.dart';
@embedded
class Skill {
  final String? name;
  final String? skillType;
  Leveling skillLeveling = Leveling(configer: 2);
  // final int expForTopics;
  final List<Topic>? relatedTopics;
  SkillTimer  skillTimer = SkillTimer();
  // String description;

  Skill({
    this.name,
    this.skillType,
    this.relatedTopics,
    // this.description = ''
  });

  @ignore
  get getSkillLevelingObj => null;


  void addExpToSkill(int value) {
    int amount = value + skillLeveling.exp;
    skillLeveling.setExp(amount);
    ExpIncreaseEvent(object: this,userLevelingObj: skillLeveling, configer: 2);
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
