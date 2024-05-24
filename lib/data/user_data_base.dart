import 'package:challenger/controllers/challenge.dart';
import 'package:challenger/controllers/mission.dart';
import 'package:challenger/controllers/skill.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import '../controllers/daily_quest.dart';
import '../controllers/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChallengerDB extends ChangeNotifier {
  ChallengerDB({this.currentUser}) {
    currentUser = Challenger(fullName: '');
  }

  //static attrs
  static late Isar isar;

  var firebaseUserInstance = FirebaseAuth.instance.currentUser!;
  CollectionReference challengersCollection =
      FirebaseFirestore.instance.collection('challengers');

  //initialize data-base
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([ChallengerSchema],
        directory: dir.path, inspector: true);
  }

  //challenger info
  late Challenger? currentUser;
  List<Mission>? missions;

  List<Skill>? skills;

  List<DailyQuest>? quests;
  List<DailyQuest>? challengeSteps;

  //-----------C R U D----------------
  Future<void> createChallenger(Challenger newUser) async {
    await isar.writeTxn(() async => await isar.challengers.put(newUser));
    currentUser = newUser;
    await firebaseUserInstance.reload();
    updateDate();
  }

  Future<void> readData() async {
    var user = await isar.challengers
        .where()
        .emailEqualTo(firebaseUserInstance.email)
        .findFirst();
    currentUser = user;
    missions = currentUser!.userMissions.toList(growable: true);
    skills = currentUser!.userSkills.toList(growable: true);
    quests = currentUser!.userQuests.toList(growable: true);
    challengeSteps =
        currentUser!.currentChallenge.dailySteps.toList(growable: true);
    notifyListeners();
  }

  Future<void> updateDate() async {
    currentUser!.userMissions = missions!;
    currentUser!.userSkills = skills!;
    currentUser!.userQuests = quests!;
    currentUser!.currentChallenge.dailySteps = challengeSteps!;
    await isar.writeTxn(() async => await isar.challengers.put(currentUser!));
    notifyListeners();
    await sendDataToServer();
  }
  void deleteUser() async {
    await isar.writeTxn(() async {
       await isar.challengers.clear();
    });
  }

//---------fireStore stuff------------
  Future<void> sendDataToServer() async {
    await challengersCollection
        .doc(firebaseUserInstance.uid)
        .set(challengerToJson());
  }

  //call the after login
  Future<void> getDataFromServer() async {
    await challengersCollection
        .doc(firebaseUserInstance.uid)
        .get()
        .then((DocumentSnapshot challenger) async {
      Challenger user =
          mapToChallenger(challenger.data() as Map<String, dynamic>);
      currentUser = user;
      await isar.writeTxn(() async => await isar.challengers.put(currentUser!));
    });
  }


//---------Object To json---------
  Map<String, dynamic> challengerToJson() {
    Map<String, dynamic> challenger = {};
    challenger["fullName"] = currentUser?.fullName;
    challenger["email"] = currentUser?.email;
    challenger["userLeveling"] = {
      "configer": currentUser?.userLeveling.configer,
      "exp": currentUser?.userLeveling.exp,
      "level": currentUser?.userLeveling.level,
      "levelUpExp": currentUser?.userLeveling.levelUpExp,
    };
    challenger["userSettings"] = {
      "skillCreatedTime": currentUser?.userSettings.skillCreatedTime,
      "skillCreationCoolDown": currentUser?.userSettings.skillCreationCoolDown,
      "skillIsCreated": currentUser?.userSettings.skillISCreated
    };
    challenger["userMissions"] = userMissionsToMap();
    challenger["userSkills"] = userSkillsToMap();
    challenger["userQuests"] = questsToMap(quests!);
    challenger["currentChallenge"] = {
      "name": currentUser?.currentChallenge.name,
      "days": currentUser?.currentChallenge.days,
      "goal": currentUser?.currentChallenge.goal,
      "startDate": currentUser?.currentChallenge.startDate,
      "dailySteps": questsToMap(challengeSteps!),
      //Todo related topics remain
    };
    return challenger;
  }

  List userMissionsToMap() {
    List? missionsNewList = [];
    for (Mission mission in missions!) {
      Map missionInfo = {
        "name": mission.name,
        "expAmount": mission.expAmount,
        "description": mission.description
      };
      missionsNewList.add(missionInfo);
    }
    return missionsNewList;
  }

  List userSkillsToMap() {
    List skillsNewList = [];
    for (Skill skill in skills!) {
      Map skillInfo = {
        "name": skill.name,
        "skillType": skill.skillType,
        "relatedTopics": skill.relatedTopics,
        "skillLeveling": {
          "configer": skill.skillLeveling.configer,
          "level": skill.skillLeveling.level,
          "exp": skill.skillLeveling.exp,
          "levelUpExp": skill.skillLeveling.levelUpExp,
        },
        "skillTimer": {
          "isActive": skill.skillTimer.isActive,
          "timeSpent": skill.skillTimer.timeSpent,
          "timerStart": skill.skillTimer.timerStart,
          "timerEnd": skill.skillTimer.timerEnd
        },
      };
      skillsNewList.add(skillInfo);
    }
    return skillsNewList;
  }

  List questsToMap(List questsList) {
    List questsNewList = [];
    for (DailyQuest quest in questsList) {
      Map questInfo = {
        "name": quest.name,
        "expAmount": quest.expAmount,
        "repeat": quest.repeat,
        "streak": quest.streak,
        //TODO the bellow key shall be parsed when want
        //TODO to convert this json to object
        "timeToBeDone": quest.timeToBeDone,
        "completedDates": quest.completedDates,
        "canceledDates": quest.canceledDates
      };
      questsNewList.add(questInfo);
    }
    return questsNewList;
  }

  //----------json to object---------
  Challenger mapToChallenger(Map<String, dynamic> userMap) {
    Challenger user = Challenger(fullName: userMap['fullName']);

    user.userLeveling.configer = userMap['userLeveling']['configer'];
    user.userLeveling.exp = userMap['userLeveling']['exp'];
    user.userLeveling.level = userMap['userLeveling']['level'];
    user.userLeveling.levelUpExp = userMap['userLeveling']['levelUpExp'];

    user.email = userMap['email'];
    //Map to Mission
    user.userMissions = mapToMission(userMap['userMissions']);
    //Map to Skill
    user.userSkills = mapToSkill(userMap['userSkills']);
    //Map to DailyQuest
    user.userQuests = mapToQuest(userMap['userQuests']);
    //Map to CurrentChallenge
    user.currentChallenge = mapToChallenge(userMap['currentChallenge']);

    return user;
  }

  List<Mission> mapToMission(List<dynamic> missionsList) {
    List<Mission> listOfMissions = [];
    for (Map<String, dynamic> m in missionsList) {
      Mission mission = Mission(
          name: m['name'],
          expAmount: m['expAmount'],
          description: m['description']);
      listOfMissions.add(mission);
    }
    return listOfMissions;
  }

  List<Skill> mapToSkill(List<dynamic> skillsList) {
    List<Skill> listOfSkills = [];
    for (Map<String, dynamic> s in skillsList) {
      Skill skill = Skill(name: s['name'], skillType: s['skillType']);
      //skillLeveling
      skill.skillLeveling.configer = s['skillLeveling']['configer'];
      skill.skillLeveling.exp = s['skillLeveling']['exp'];
      skill.skillLeveling.level = s['skillLeveling']['level'];
      skill.skillLeveling.levelUpExp = s['skillLeveling']['configer'];
      //skillTimer
      skill.skillTimer.isActive = s['skillTimer']['isActive'];
      skill.skillTimer.timerStart = s['skillTimer']['timerStart'];
      skill.skillTimer.timeSpent = s['skillTimer']['timeSpent'];
      skill.skillTimer.timerEnd = s['skillTimer']['timerEnd'];
      listOfSkills.add(skill);
    }
    return listOfSkills;
  }

  List<DailyQuest> mapToQuest(List<dynamic> questsList) {
    List<DailyQuest> listOfQuests = [];
    for (Map<String, dynamic> q in questsList) {
      DailyQuest quest = DailyQuest(name: q['name'], expAmount: q['expAmount']);
      quest.streak = q['streak'];
      quest.repeat = q['repeat'];
      quest.timeToBeDone = (q['timeToBeDone'] as Timestamp).toDate();
      for (var date in q['canceledDates']) {
        DateTime newTime = (date as Timestamp).toDate();
        quest.completedDates.add(newTime);
      }
      for (var date in q['completedDates']) {
        DateTime newTime = (date as Timestamp).toDate();
        quest.completedDates.add(newTime);
      }
      listOfQuests.add(quest);
    }
    return listOfQuests;
  }

  Challenge mapToChallenge(Map<String, dynamic> challengeMap) {
    Challenge currentChallenge = Challenge();

    currentChallenge.name = challengeMap['name'];
    currentChallenge.goal = challengeMap['goal'];
    currentChallenge.days = challengeMap['days'];
    currentChallenge.startDate = challengeMap['startDate'];
    currentChallenge.dailySteps = mapToQuest(challengeMap['dailySteps']);

    return currentChallenge;
  }
}
