import 'package:challenger/controllers/events/levelingevents.dart';
import 'package:challenger/controllers/leveling.dart';
import 'package:challenger/controllers/mission.dart';
import 'package:challenger/controllers/settings.dart';
import 'package:challenger/controllers/skill_timer.dart';
import 'package:challenger/controllers/topic.dart';
import 'package:challenger/controllers/skill.dart';
import 'package:isar/isar.dart';

import 'daily_quest.dart';

part 'user.g.dart';

//the class to interact with every thing related to user

@collection
class Challenger {
  @Name('id')
  Id challengerId = Isar.autoIncrement;
  @Index(unique: true, replace: true, caseSensitive: false)
  String? email;
  String fullName;
  Leveling userLeveling = Leveling(configer: 0);
  UserSettings userSettings = UserSettings();
  final List<Topic> topicsList = [];

  //list view will be created with this lists
  List<Mission> userMissions = [];
  List<Skill> userSkills = [];
  List<DailyQuest> userQuests = [];


  Challenger({
    required this.fullName,
  }) {
    resetUserLevel();
  }

  @ignore
  double get getExpPerc => userLeveling.exp / userLeveling.levelUpExp * 100;

  Topic getTopicByIndex(int index) => topicsList[index];

  int getUserTopicLevelUpExpByIndex(int index) =>
      topicsList[index].topicLeveling.levelUpExp;

  int getUserTopicExpByIndex(int index) => topicsList[index].topicLeveling.exp;

  int getUSerTopicLevelByIndex(int index) =>
      topicsList[index].topicLeveling.level;

  //add exp to user and update user box in hive
  void addExpToUser(int value) {
    int amount = value + userLeveling.exp;
    userLeveling.setExp(amount);
    ExpIncreaseEvent(userLevelingObj: userLeveling);
    //TODO update user and save it in the hive
  }

  void addExpToTheTopicByIndex(int index, int value) =>
      topicsList[index].addExpToTopic(value);

  //reset level to zero
  //it will be called ony when new user is created
  void resetUserLevel() {
    userLeveling.resetLevel(0);
  }

  //add new topic to topic list
  void addTopic(String name) {
    Topic newTopic = Topic(name: name);
    topicsList.add(newTopic);
    //TODO update dataBase to save in the local storage
  }

  void addNewSkill(Skill newSkill) {
    userSkills.add(newSkill);
  }
}
// Map<String, dynamic> userToMap(Challenger givenUser) {
//   String fullName = givenUser.fullName;
//   int level = givenUser.userLeveling.level;
//   int exp = givenUser.userLeveling.exp;
//   int levelUpExp = givenUser.userLeveling.levelUpExp;
//
//   List<Topic> topics = givenUser.topicsList;
//   List formattedTopics = _topicsToList(topics);
//
//   List<Skill> skills = givenUser.userSkills;
//   List formattedSkills = _skillsToList(skills);
//
//   List<Mission> missions = givenUser.userMissions;
//   List formattedMissions = _missionToList(missions);
//
//   Map<String, dynamic> formattedUser = {
//     'fullName': fullName,
//     'level': level,
//     'exp': exp,
//     'levelUpExp': levelUpExp,
//     'topics': formattedTopics,
//     'skills': formattedSkills,
//     'missions': formattedMissions
//   };
//   return formattedUser;
// }
//
// //gets a list of Topic object and converts them to a list of lists that
// //contains topic information
// List _topicsToList(List<Topic> topics) {
//   List formattedTopics = [];
//   for (Topic topic in topics) {
//     String? topicName = topic.name;
//     int topicLevel = topic.topicLeveling.level;
//     int topicExp = topic.topicLeveling.exp;
//     int topicLevelUpExp = topic.topicLeveling.levelUpExp;
//
//     //will be formatted like :
//     //[topicName, topicLevel, topicExp, topLevelUpExp]
//
//     List<dynamic> topicFormatted = [
//       topicName,
//       topicLevel,
//       topicExp,
//       topicLevelUpExp
//     ];
//     formattedTopics.add(topicFormatted);
//   }
//   return formattedTopics;
// }
//
// List _skillsToList(List<Skill> skills) {
//   List formattedSkills = [];
//
//   for (Skill skill in skills) {
//     String? name = skill.name;
//     String? skillType = skill.skillType;
//     int level = skill.getSkillLevelingObj.getLevel;
//     int exp = skill.getSkillLevelingObj.getExp;
//     int levelUpExp = skill.getSkillLevelingObj.getLevelUpExp;
//     List<Topic> relatedTopics = skill.relatedTopics!;
//     List formattedRelatedTopics = _topicsToList(relatedTopics);
//     List<dynamic> skillFormatted = [
//       name,
//       skillType,
//       level,
//       exp,
//       levelUpExp,
//       formattedRelatedTopics
//     ];
//     formattedSkills.add(skillFormatted);
//   }
//   return formattedSkills;
// }
//
// List _missionToList(List<Mission> missions) {
//   List formattedMissions = [];
//   for (Mission mission in missions) {
//     String? name = mission.name;
//     int? expAmount = mission.expAmount;
//     String? description = mission.description;
//     List<dynamic> missionFormatted = [name, expAmount, description];
//     formattedMissions.add(missionFormatted);
//   }
//   return formattedMissions;
// }
