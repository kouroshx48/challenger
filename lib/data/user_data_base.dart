import 'package:challenger/controllers/mission.dart';
import 'package:challenger/controllers/skill.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import '../controllers/daily_quest.dart';
import '../controllers/user.dart';

class ChallengerDB extends ChangeNotifier {
  ChallengerDB({this.currentUser}) {
    currentUser = Challenger(fullName: '');
  }

  //static attrs
  static late Isar isar;

  var firebaseUserInstance = FirebaseAuth.instance.currentUser!;

  //initialize data-base
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([ChallengerSchema], directory: dir.path, inspector: true);
  }

  //challenger info
  late Challenger? currentUser;
  List<Mission>?  missions ;
  List<Skill>? skills ;
  List<DailyQuest>? quests;


  //-----------C R U D----------------
  void createChallenger(Challenger newUser) async {
    await isar.writeTxn(() async => await isar.challengers.put(newUser));
    currentUser = newUser;
    updateDate();
  }

  void readData() async {
    var user = await isar.challengers
        .where()
        .emailEqualTo(firebaseUserInstance.email)
        .findFirst();
    print(firebaseUserInstance.email.toString());
    currentUser = user;
    missions = currentUser!.userMissions.toList(growable: true);
    skills = currentUser!.userSkills.toList(growable: true);
    quests = currentUser!.userQuests.toList(growable: true);
    notifyListeners();
  }

  void updateDate() async {
    currentUser!.userMissions = missions!;
    currentUser!.userSkills = skills!;
    currentUser!.userQuests = quests!;
    // print(currentUser!.userLeveling.level);
    // print(currentUser!.userLeveling.exp);
    // print(currentUser!.userLeveling.levelUpExp);
    await isar.writeTxn(() async => await isar.challengers.put(currentUser!));
    readData();
  }
  //no need for delete right now

  //---------U S E R---------

}
