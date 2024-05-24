import 'package:isar/isar.dart';

part 'settings.g.dart';

@embedded
class UserSettings {
  //check if new skill is created
  bool skillISCreated = false ;

  //date skill created
  DateTime? skillCreatedTime;

  //time to create new skill in seconds
  int skillCreationCoolDown = 2 * (60*60*24*7);


  void defaultSettings(){
    skillCreationCoolDown = 2 * (60*60*24*7); //2 weeks
  }
  void resetSkillTimerToZero(){
    skillISCreated = false;
    skillCreatedTime = null;
  }
}
