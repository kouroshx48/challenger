import 'package:isar/isar.dart';

part 'leveling.g.dart';

@embedded
class Leveling {
  int level = 1;
  int exp = 0;
  late int levelUpExp =
      configer == 0 ? 10 : (configer == 1 ? 125 : (configer == 2 ? 5 : 10));

  //0 = user leveling
  //1 = topic leveling
  //2 = skill leveling
  int? configer;

  Leveling({this.configer});

  void setLevel(int value) => level = value;

  void setExp(int value) => exp = value;

  void setLevelUpExp(int value) => levelUpExp = value;

  void resetLevel(int configer) {
    setLevel(1);
    setExp(0);
    if (configer == 0) {
      setLevelUpExp(10);
    } else if (configer == 1) {
      setLevelUpExp(125);
    } else if (configer == 2) {
      setLevelUpExp(5);
    }
  }

  int newLevel() {
    int newLevelCalc = level!;
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
