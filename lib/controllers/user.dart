import 'package:challenger/controllers/events/levelingevents.dart';
import 'package:challenger/controllers/leveling.dart';
import 'package:challenger/controllers/mission.dart';
import 'package:challenger/controllers/topic.dart';
import 'package:challenger/controllers/skill.dart';
import 'package:hive_flutter/adapters.dart';



//the class to interact with every thing related to user
class User{
  final String fullName;
  final Leveling _userLevel = Leveling(configer: 0);
  final List<Topic> topicsList = [];

  //list view will be created with this lists
  final List<Mission> _userMissions = [];
  final List<Skill> _userSkills = [];

  User({
    required this.fullName,
  }) {
    resetUserLevel();
  }

  int get getUserLevel => _userLevel.getLevel;

  int get getUserExp => _userLevel.getExp;

  int get getExpNeededToLevelUp => _userLevel.getLevelUpExp;

  double get getExpPerc => _userLevel.expPercent();

  Leveling get getLevelObject => _userLevel;

  String get getFullName => fullName;

  Topic getTopicByIndex(int index) => topicsList[index];

  int getUserTopicLevelUpExpByIndex(int index) =>
      topicsList[index].getTopicLevelObj.getLevelUpExp;

  int getUserTopicExpByIndex(int index) =>
      topicsList[index].getTopicLevelObj.getExp;

  int getUSerTopicLevelByIndex(int index) =>
      topicsList[index].getTopicLevelObj.getLevel;

  List<Mission> get getUserMissions => _userMissions;
  List<Skill> get getUserSkills => _userSkills;

  //add exp to user and update user box in hive
  void addExpToUser(int value) {
    int amount = value + getUserExp;
    getLevelObject.setExp(amount);
    ExpIncreaseEvent(userLevelingObj: getLevelObject);
    //TODO update user and save it in the hive
  }

  void addExpToTheTopicByIndex(int index, int value) =>
      topicsList[index].addExpToTopic(value);

  //reset level to zero
  //it will be called ony when new user is created
  void resetUserLevel() {
    _userLevel.resetLevel(0);
  }

  //add new topic to topic list
  void addTopic(String name){
    Topic newTopic = Topic(name: name);
    topicsList.add(newTopic);
    //TODO update dataBase to save in the local storage

  }

}

final User testUser = User(fullName: 'Kourosh Fouladvand');
