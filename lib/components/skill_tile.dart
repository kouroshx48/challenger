import 'dart:async';
import 'package:challenger/data/user_data_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class SkillTile extends StatefulWidget {
  final int skillIndex;

  const SkillTile({
    super.key,
    required this.skillIndex,
  });

  @override
  State<SkillTile> createState() => _SkillTileState();
}

class _SkillTileState extends State<SkillTile> {
  Timer? _timer;

  void _loadData() async {
    context.read<ChallengerDB>().readData();
    final skill = context
        .read<ChallengerDB>()
        .skills![widget.skillIndex];
    if (skill.skillTimer.timeSpent >= skill.skillTimer.timerEnd) {
      //reset time spent
      skill.skillTimer.timeSpent = 0;
      // add point to skill
      setState(() {
        skill.addExpToSkill(1);
      });
      skill.skillTimer.timerStart = null;
      skill.skillTimer.isActive = false;
      skill.skillTimer.timeSpentBeforePause = 0;
      _timer?.cancel();
      context.read<ChallengerDB>().updateDate();
    }
    _loadTimer();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void onSkillPointAdding() {
    final skill = context
        .read<ChallengerDB>()
        .skills![widget.skillIndex];
    //change the timer activation
    setState(() {
      skill.skillTimer.isActive = !(skill.skillTimer.isActive);
    });
    context.read<ChallengerDB>().updateDate();
    // check if skill timer is active
    if (skill.skillTimer.isActive) {
      //set the start time to now
      skill.skillTimer.timerStart = DateTime.now();
      context.read<ChallengerDB>().updateDate();
      //if is active load timer
      _loadTimer();
    } else {
      //else cancel timer
      if (_timer!.isActive) {
        skill.skillTimer.timeSpentBeforePause = skill.skillTimer.timeSpent;
        context.read<ChallengerDB>().updateDate();
        _timer!.cancel();
      }
    }
  }

  void _loadTimer() {
    final skill = context
        .read<ChallengerDB>()
        .skills![widget.skillIndex];
    //check if skill is active
    if (skill.skillTimer.isActive) {
      //create the timer
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        final now = DateTime.now();
        final skill = context
            .read<ChallengerDB>()
            .skills![widget.skillIndex];
        int diff = now
            .difference(skill.skillTimer.timerStart!)
            .inSeconds;
        setState(() {
          skill.skillTimer.timeSpent =
              skill.skillTimer.timeSpentBeforePause + diff;
        });
        context.read<ChallengerDB>().updateDate();
        //check if timer ends
        if (skill.skillTimer.timeSpent >= skill.skillTimer.timerEnd) {
          //reset time spent
          skill.skillTimer.timeSpent = 0;
          // add point to skill
          setState(() {
            skill.addExpToSkill(1);
            if (skill.skillLeveling.exp == 0){
              final user = context.read<ChallengerDB>().currentUser;
              user?.addExpToUser((3 * (skill.skillLeveling.level - 1) + 2) * 10);
            }
          });
          skill.skillTimer.timerStart = null;
          skill.skillTimer.isActive = false;
          skill.skillTimer.timeSpentBeforePause = 0;
          _timer?.cancel();
          context.read<ChallengerDB>().updateDate();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengerDB>(
      builder: (BuildContext context, ChallengerDB value, Widget? child) =>
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
            child: Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    foregroundColor: Colors.white,
                    onPressed: (context) {
                      removeSkill(widget.skillIndex);
                    },
                    icon: CupertinoIcons.delete,
                    backgroundColor: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircularPercentIndicator(
                                radius: 30,
                                lineWidth: 8,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: InkWell(
                                    onTap: () => onSkillPointAdding(),
                                    borderRadius: BorderRadius.circular(50),
                                    child: !value.skills![widget.skillIndex]
                                        .skillTimer.isActive
                                        ? const Icon(
                                      Icons.play_arrow,
                                      color: Colors.white70,
                                    )
                                        : const Icon(Icons.pause,
                                        color: Colors.white70)),
                                percent: value.skills![widget.skillIndex]
                                    .skillTimer
                                    .timeSpent /
                                    value.skills![widget.skillIndex].skillTimer
                                        .timerEnd,
                                backgroundColor: Colors.grey.shade500,
                                progressColor: value.skills![widget.skillIndex]
                                    .skillTimer.timeSpent /
                                    value.skills![widget.skillIndex]
                                        .skillTimer.timerEnd <
                                    .5
                                    ? Colors.red.shade400
                                    : (value.skills![widget.skillIndex]
                                    .skillTimer
                                    .timeSpent /
                                    value.skills![widget.skillIndex]
                                        .skillTimer.timerEnd <
                                    .75
                                    ? Colors.orange.shade400
                                    : Colors.green.shade400),
                              ),
                              const SizedBox(
                                width: 22,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        value.skills![widget.skillIndex].name!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white70,
                                            fontSize: 20),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        '(lvl ${value.skills![widget.skillIndex]
                                            .skillLeveling.level})',
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                  Text(formatTimer(value.skills![widget.skillIndex]
                                      .skillTimer
                                      .timeSpent), style:  TextStyle(color: Colors.grey[600], fontSize: 18),
                                      )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              '(${value.skills![widget.skillIndex].skillType})',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LinearPercentIndicator(
                        lineHeight: 15,
                        percent:
                        value.skills![widget.skillIndex].skillLeveling.exp /
                            value.skills![widget.skillIndex].skillLeveling
                                .levelUpExp,
                        animation: true,
                        animationDuration: 1200,
                        progressColor: Colors.green[400],
                        barRadius: const Radius.circular(12),
                        leading: Text(
                          value.skills![widget.skillIndex].skillLeveling.exp
                              .toString(),
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        trailing: Text(
                          value.skills![widget.skillIndex].skillLeveling
                              .levelUpExp
                              .toString(),
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        animateFromLastPercent: true,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  void removeSkill(int index) {
    final skills = context
        .read<ChallengerDB>()
        .skills;
    skills!.removeAt(index);
    context.read<ChallengerDB>().updateDate();
  }

  String formatTimer(int seconds){
    int sec = (seconds >= 60)? seconds % 60: seconds;
    int min = (seconds >= 60)? (seconds / 60).floor(): 0;
    int hour = (min >= 60)? (min/60).floor(): 0;

    String secString = (sec < 10)? "0$sec" : "$sec";
    String minString = (min < 10)? "0$min" : "$min";
    String hourString = (hour < 10)? "0$hour" : "$hour";

    return '$hourString:$minString:$secString';
  }
}
