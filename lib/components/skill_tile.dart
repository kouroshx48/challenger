import 'dart:async';

import 'package:challenger/controllers/skill.dart';
import 'package:challenger/controllers/skill_timer.dart';
import 'package:challenger/data/user_data_base.dart';
import 'package:flutter/material.dart';
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
  //[isTimerActive,timeSpent, timerEnd  ]
  Timer? _timer;
  late Skill skill;

  void _loadData() async {
    context.read<ChallengerDB>().readData();
    skill = context.read<ChallengerDB>().skills![widget.skillIndex];
    _loadTimer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  void onSkillPointAdding() {
    context.read<ChallengerDB>().readData();
    skill = context.read<ChallengerDB>().skills![widget.skillIndex];
    _timer?.cancel();
    if (skill.skillTimer.timerStart == null) {
      skill.skillTimer.timerStart = DateTime.now();

      setState(() {
        skill.skillTimer.isActive = true;
      });
      _loadTimer();
      context.read<ChallengerDB>().updateDate();
      print('this');
    }else{
      if(skill.skillTimer.isActive){
        setState(() {
          skill.skillTimer.isActive = false;
        });
        context.read<ChallengerDB>().updateDate();
        _timer?.cancel();
      }else{
        setState(() {
          skill.skillTimer.isActive = true;
        });
        context.read<ChallengerDB>().updateDate();
        _loadTimer();
      }
    }

  }

  void _loadTimer() {
    if (skill.skillTimer.isActive) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        DateTime newTime = DateTime.now();
         skill = context.read<ChallengerDB>().skills![widget.skillIndex];
         var diff = newTime.difference(skill.skillTimer.timerStart!);
        skill.skillTimer.timeSpent = diff.inSeconds;
        print(skill.skillTimer.timeSpent);
        if (skill.skillTimer.timeSpent >= skill.skillTimer.timerEnd) {
          skill.skillTimer.timeSpent = 0;
          skill.skillTimer.timerStart = null;
          skill.skillTimer.isActive = false;
          //TODO add point to skill
          skill.addExpToSkill(1);
          context.read<ChallengerDB>().updateDate();
          _timer?.cancel();
          print('timer canceled');
        }
        context.read<ChallengerDB>().updateDate();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengerDB>(
      builder: (BuildContext context, ChallengerDB value, Widget? child) =>
          Padding(
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
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
                              onTap: onSkillPointAdding,
                              borderRadius: BorderRadius.circular(50),
                              child: !skill
                                      .skillTimer.isActive
                                  ? const Icon(
                                      Icons.play_arrow,
                                      color: Colors.white70,
                                    )
                                  : const Icon(Icons.pause,
                                      color: Colors.white70)),
                          percent: skill.skillTimer
                                  .timeSpent /
                              skill.skillTimer
                                  .timerEnd,
                          backgroundColor: Colors.grey.shade500,
                          progressColor: skill
                                          .skillTimer.timeSpent /
                                      skill
                                          .skillTimer.timerEnd <
                                  .5
                              ? Colors.red.shade400
                              : (skill.skillTimer
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
                                  skill.name!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  '(lvl ${skill.skillLeveling.level})',
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 14),
                                )
                              ],
                            ),
                            Text(skill.skillTimer.timeSpent
                                .toString())
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        '(${skill.skillType})',
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
                  percent: skill.skillLeveling.exp / skill.skillLeveling.levelUpExp,
                  animation: true,
                  animationDuration: 1200,
                  progressColor: Colors.green[400],
                  barRadius: const Radius.circular(12),
                  leading: Text(
                    skill.skillLeveling.exp.toString(),
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  trailing: Text(
                    skill.skillLeveling.levelUpExp.toString(),
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
    );
  }
}
