import 'package:isar/isar.dart';

part 'settings.g.dart';

@embedded
class UserSettings {
  //check if new skill is created
  bool skillISCreated = false ;

  //date skill created
  DateTime? skillCreatedTime;

  //time to create new skill in seconds
  int skillCreationCoolDown = 10;


  void defaultSettings(){
    skillCreationCoolDown = 10; //in seconds
  }
  void resetSkillTimerToZero(){
    skillISCreated = false;
    skillCreatedTime = null;
  }
}
