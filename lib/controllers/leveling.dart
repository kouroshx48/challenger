import 'package:hive_flutter/adapters.dart';
part 'leveling.g.dart';

@HiveType(typeId: 2, adapterName: 'LevelingAdapter')
class Leveling {
  @HiveField(0)
  int _level = 1;
  @HiveField(1)
  int _exp = 0;
  @HiveField(2)
  int _levelUpExp = 10;

  //0 = user leveling
  //1 = topic leveling
  //2 = skill leveling
  @HiveField(3)
  int configer;

  Leveling({required this.configer}) {
    resetLevel(configer);
  }

  int get getExp => _exp;

  int get getLevel => _level;

  int get getLevelUpExp => _levelUpExp;

  void setLevel(int value) => _level = value;

  void setExp(int value) => _exp = value;

  void setLevelUpExp(int value) => _levelUpExp = value;

  void resetLevel(int configer) {
    setLevel(1);
    setExp(0);
    if (configer == 0) {
      setLevelUpExp(10);
    }else if(configer == 1){
      setLevelUpExp(125);
    }else if(configer == 2){
      setLevelUpExp(5);
    }
  }

  double expPercent() {
    double perc = (getExp * 100) / getLevelUpExp;
    return perc;
  }

  int newLevel() {
    int newLevelCalc = getLevel;
    return newLevelCalc;
  }

  int newConfiger(int functionInt) {
    return functionInt;
  }

  int newLevelUpExp() {
    int formula = 10 * (newLevel() * newLevel());
    return formula;
  }

  int newTopicLevelUpExp() {
    int formula = newLevel() * 125;
    return formula;
  }

  int newSkillLevelUpExp() {
    int formula = 3 * newLevel() + 2;
    return formula;
  }
}
