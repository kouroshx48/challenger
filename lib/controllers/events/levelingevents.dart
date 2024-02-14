import 'package:challenger/controllers/leveling.dart';
import 'package:challenger/controllers/skill.dart';

//when user exp increases this event will be called
class ExpIncreaseEvent {
  Skill? object;
  Leveling userLevelingObj;
  int configer;

  ExpIncreaseEvent({
    this.object,
    required this.userLevelingObj,
    this.configer = 0,
  }) {
    // print('seda zade shod');
    tryToLevelUp();
  }

  void tryToLevelUp() {
    // print('check if ready');
    if (isReadyToLevelUp() == true) {
      // print('is ready');
      // print('is ready to level up activated');
      LevelUpEvent(
          userLevelingObj: userLevelingObj,
          pastLevel: userLevelingObj.getLevel,
          expBeforeLeveling: userLevelingObj.getExp,
          pastLevelUpExp: userLevelingObj.getLevelUpExp,
          configer: configer);
    }
    // }else{print('is not ready');}
  }

  bool isReadyToLevelUp() {
    // print(userLevelingObj.getLevel);
    // print(userLevelingObj.getExp );
    // print(userLevelingObj.getLevelUpExp);
    if (userLevelingObj.getExp >= userLevelingObj.getLevelUpExp) {
      return true;
    } else {
      return false;
    }
  }
}

//when player is going to level up
class LevelUpEvent {
  Skill? leveledUpObj;
  Leveling userLevelingObj;
  int pastLevel;
  int expBeforeLeveling;
  int pastLevelUpExp;

  //configer ids
  // 0 -> user
  // 1 -> topic
  // 2 -> skill
  int configer;

  LevelUpEvent(
      {this.leveledUpObj,
      required this.userLevelingObj,
      required this.pastLevel,
      required this.expBeforeLeveling,
      required this.pastLevelUpExp,
      required this.configer}) {
    _levelUp();
    // if(configer == 2){
    //   leveledUpObj.addExpToRelatedTopics();
    // }
    //this event is called because user could leveled up multiple time
    //this is to check if user can level up  again or not
    ExpIncreaseEvent(object: leveledUpObj, userLevelingObj: userLevelingObj);
  }

  //default config
  //config id 0
  int calcNewLevel() {
    int newLevelCalc = pastLevel + 1;
    return newLevelCalc;
  }

  //config id 1
  int calcNewLevelUpExp() {
    // int formula = 10 * (calcNewLevel() * calcNewLevel());
    // return formula;
    if (configer == 1) {
      return userLevelingObj.newTopicLevelUpExp();
    } else if (configer == 2) {
      return userLevelingObj.newSkillLevelUpExp();
    }
    return userLevelingObj.newLevelUpExp();
  }

  //config id 2
  int calcExpAfterLevelUp() {
    int expAfterLevelingCalc = expBeforeLeveling - pastLevelUpExp;
    return expAfterLevelingCalc;
  }

  void _levelUp() {
    // print(calcNewLevel());
    // print(calcNewLevelUpExp());
    userLevelingObj.setLevel(calcNewLevel());
    userLevelingObj.setExp(calcExpAfterLevelUp());
    userLevelingObj.setLevelUpExp(calcNewLevelUpExp());
  }

// void eventCustomConfig(Map<int, int>? configMap) {
//   if (configMap != null) {
//     if (configMap.containsKey(0)){
//       conf0 = configMap[0];
//     }
//     if (configMap.containsKey(1)){
//       conf1 = configMap[1];
//     }
//     if (configMap.containsKey(2)){
//       conf2 = configMap[2];
//     }
//   }
// }
}
