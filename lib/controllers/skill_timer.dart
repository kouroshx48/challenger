import 'dart:core';
import 'package:isar/isar.dart';
part 'skill_timer.g.dart';

@embedded
class SkillTimer{
  bool isActive = false;
  DateTime? timerStart;
  int timeSpent = 0;
  int timeSpentBeforePause = 0;
  int timerEnd = 60; //in seconds
}