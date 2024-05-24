import 'package:challenger/components/clippers.dart';
import 'package:challenger/components/my_button.dart';
import 'package:challenger/controllers/challenge.dart';
import 'package:challenger/controllers/daily_quest.dart';
import 'package:challenger/data/user_data_base.dart';
import 'package:challenger/screens/challenge_create_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  bool _changePage = false;
  late DateTime _challengeEndDate;

  void _loadDate() {
    context.read<ChallengerDB>().readData();
    final currentChallenge =
        context.read<ChallengerDB>().currentUser?.currentChallenge;
    final user = context.read<ChallengerDB>().currentUser;
    if (currentChallenge?.name != null) {

      _challengeEndDate = DateUtils.addDaysToDate(
          currentChallenge!.startDate!, currentChallenge.days!);
    } else {
      _challengeEndDate = DateTime.now();
    }
    if (_challengeEndDate.difference(DateTime.now()).inDays + 1 == 0) {
      List steps = currentChallenge!.dailySteps;
      int questDone = 0;
      int questCanceled = 0;
      for(DailyQuest step in steps){
        if(step.completedDates.isEmpty && step.canceledDates.isEmpty ){
          questCanceled += 1;
        }
        questDone += step.completedDates.length;
        questCanceled += step.canceledDates.length;
      }
      int rewardExp = (questDone - questCanceled) * 10;
      if(rewardExp > 0){
        user!.addExpToUser(rewardExp);
        setState(() {
          user.currentChallenge = Challenge();
          currentChallenge.dailySteps.clear();
          context.read<ChallengerDB>().updateDate();
        });
      }else{
        setState(() {
          user?.currentChallenge = Challenge();
          currentChallenge.dailySteps.clear();
          context.read<ChallengerDB>().updateDate();
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDate();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengerDB>(
        //this condition is for page which shall be no challenge or with challenge
        builder: (context, value, child) => !_changePage
            ? SingleChildScrollView(
                child: Stack(
                  children: [
                    (value.currentUser?.currentChallenge.name == null)
                        //if challenge does not exist
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, bottom: 8.0, top: 200),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: GestureDetector(
                                  onTap: () {
                                    onPageChange();
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        CupertinoIcons.add,
                                        size: 70,
                                        color: Colors.grey[700],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'start new challenge',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        //if there is challenge already
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, bottom: 8.0, top: 115),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //today date
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      getMonthWithString(int.parse(
                                          DateFormat.M()
                                              .format(DateTime.now()))),
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 25),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(DateTime.now().day.toString(),
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 25))
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Days remaining : ",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  (_challengeEndDate
                                              .difference(DateTime.now())
                                              .inDays +
                                          1)
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                //this will delete the challenge for test
                                //todo daily quest part
                                !isStepCompleted()
                                    ? (!isStepCanceled()
                                        ? getTodoCard()
                                        : getTodoCardCanceled())
                                    : getTodoCardCompleted(),

                                SizedBox(
                                  height: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 60.0),
                                        child: InkWell(
                                          onTap: () => deleteDialog(),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey[900],
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            height: 55,
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.not_interested,
                                                    color: Colors.red[300],
                                                    size: 28,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Forfeit Challenge",
                                                    style: TextStyle(
                                                        color: Colors.grey[200],
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                //todo process
                              ],
                            ),
                          ),
                    ClipPath(
                      clipper: ChallengeClipper(),
                      child: Container(
                        height: 130,
                        color: Colors.grey,
                        child: Center(
                            //this condition is for the title within container
                            child: Padding(
                                padding: const EdgeInsets.only(bottom: 0.0),
                                child: Column(
                                  children: [
                                    Text(
                                      (value.currentUser?.currentChallenge
                                                  .name ==
                                              null)
                                          ? "No Challenge started!!"
                                          : "Challenge in process : ",
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    value.currentUser?.currentChallenge.name !=
                                            null
                                        ? Text(
                                            "${value.currentUser?.currentChallenge.name}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                ))),
                      ),
                    ),
                  ],
                ),
              )
            : ChallengeCreatorScreen(
                pageChanger: onPageChange,
              ));
  }

  void onPageChange() {
    setState(() {
      _changePage = !_changePage;
    });
  }

  String getMonthWithString(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Error";
    }
  }

  Widget getTodoCard() {
    DailyQuest step = getTodayQuest()!;

    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  step.name!,
                  style: TextStyle(
                      color: Colors.green[400],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Exp Amount : ${step.expAmount}',
              style: TextStyle(color: Colors.grey[400], fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              DateFormat("MM/dd").format(step.timeToBeDone!),
              style: TextStyle(color: Colors.grey[600], fontSize: 17),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      onStepCancel();
                    },
                    icon: Icon(
                      CupertinoIcons.clear,
                      color: Colors.red[300],
                    )),
                IconButton(
                    onPressed: () {
                      onStepComplete();
                    },
                    icon: Icon(
                      Icons.check_sharp,
                      color: Colors.green[300],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getTodoCardCompleted() {
    DailyQuest step = getTodayQuest()!;
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(step.name!,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 17,
            ),
            Text('Today\'s Quest Completed',
                style: TextStyle(
                    color: Colors.green[300],
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            const Spacer(),
            Icon(
              Icons.check_sharp,
              size: 32,
              color: Colors.green[500],
            ),
            const Spacer(),
            Text('Wait For Tomorrow\'s Quest',
                style: TextStyle(
                    color: Colors.orange[600],
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget getTodoCardCanceled() {
    DailyQuest step = getTodayQuest()!;
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(step.name!,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 17,
            ),
            Text('Today\'s Quest Is Not Completed',
                style: TextStyle(
                    color: Colors.red[300],
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const Spacer(),
            Icon(
              CupertinoIcons.clear,
              size: 32,
              color: Colors.red[500],
            ),
            const Spacer(),
            Text('Wait For Tomorrow\'s Quest',
                style: TextStyle(
                    color: Colors.orange[600],
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  DailyQuest? getTodayQuest() {
    final challengeSteps = context.read<ChallengerDB>().challengeSteps;
    for (DailyQuest step in challengeSteps!) {
      if (DateUtils.isSameDay(step.timeToBeDone, DateTime.now())) {
        return step;
      }
    }
    return null;
  }

  bool isStepCompleted() {
    DailyQuest step = getTodayQuest()!;
    if (step.completedDates.isNotEmpty) {
      if (DateUtils.isSameDay(step.completedDates[0], DateTime.now())) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool isStepCanceled() {
    DailyQuest step = getTodayQuest()!;
    if (step.canceledDates.isNotEmpty) {
      if (DateUtils.isSameDay(step.canceledDates[0], DateTime.now())) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void onStepComplete() {
    DailyQuest step = getTodayQuest()!;
    List<DateTime> stepDateCompleted =
        step.completedDates.toList(growable: true);
    int? indexOfQuest = context
        .read<ChallengerDB>()
        .currentUser
        ?.currentChallenge
        .dailySteps
        .indexOf(getTodayQuest()!);
    setState(() {
      stepDateCompleted.add(DateTime.now());
      context
          .read<ChallengerDB>()
          .currentUser
          ?.currentChallenge
          .dailySteps[indexOfQuest!]
          .completedDates = stepDateCompleted;
      context.read<ChallengerDB>().currentUser?.addExpToUser(step.expAmount!);
    });
    print(stepDateCompleted);
    context.read<ChallengerDB>().updateDate();
  }

  void onStepCancel() {
    DailyQuest step = getTodayQuest()!;
    List<DateTime> stepDateCanceled = step.canceledDates.toList(growable: true);
    int? indexOfQuest = context
        .read<ChallengerDB>()
        .currentUser
        ?.currentChallenge
        .dailySteps
        .indexOf(getTodayQuest()!);
    setState(() {
      stepDateCanceled.add(DateTime.now());
      context
          .read<ChallengerDB>()
          .currentUser
          ?.currentChallenge
          .dailySteps[indexOfQuest!]
          .canceledDates = stepDateCanceled;
      context.read<ChallengerDB>().currentUser?.addExpToUser(step.expAmount!);
    });
    context.read<ChallengerDB>().updateDate();
  }

  void deleteDialog() {
    final currentUser = context.read<ChallengerDB>().currentUser;
    final challengeSteps = context.read<ChallengerDB>().challengeSteps;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[400],
            content: SizedBox(
              height: 200,
              width: 300,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Are you sure that you want to forfeit this challenge?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyButton(
                          buttonText: "no",
                          onPressed: () => Navigator.pop(context)),
                      MyButton(
                          buttonText: "yes",
                          onPressed: () {
                            setState(() {
                              currentUser?.currentChallenge = Challenge();
                              challengeSteps?.clear();
                              context.read<ChallengerDB>().updateDate();
                            });
                            Navigator.pop(context);
                          }),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
