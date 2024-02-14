import 'package:challenger/controllers/events/levelingevents.dart';
import 'package:challenger/controllers/leveling.dart';

class Topic{
  final String name;
  final Leveling _topicLevel = Leveling(configer: 1);


  Topic({
    required this.name,

  }) {
    getTopicLevelObj.setLevelUpExp(50);
  }

  String get getTopicName => name;

  Leveling get getTopicLevelObj => _topicLevel;



  void addExpToTopic(int value) {
    // print('add exp to topic');
    int amount = value + getTopicLevelObj.getExp;
    _topicLevel.setExp(amount);
    ExpIncreaseEvent(userLevelingObj: getTopicLevelObj, configer: 1);
  }
  //add related skill to the list
  void addRelatedSkillToTopic(){}

}

