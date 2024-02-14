import 'dart:async';

import 'package:challenger/controllers/skill.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SkillTile extends StatelessWidget {
  final Skill skill;
  final List timerController;
  final VoidCallback onSkillPointTimer;

  const SkillTile(
      {super.key,
      required this.skill,
      required this.onSkillPointTimer,
      required this.timerController});

  //[isTimerActive,timeSpent, timerEnd  ]

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                            onTap: onSkillPointTimer,
                            borderRadius: BorderRadius.circular(50),
                            child: !timerController[0]
                                ? const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white70,
                                  )
                                : const Icon(Icons.pause,
                                    color: Colors.white70)),
                        percent: timerController[1] / timerController[2],
                        backgroundColor: Colors.grey.shade500,
                        progressColor:
                            timerController[1] / timerController[2] < .5
                                ? Colors.red.shade400
                                : (timerController[1] / timerController[2] < .75
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
                                skill.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                '(lvl ${skill.getSkillLevelingObj.getLevel})',
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: 14),
                              )
                            ],
                          ),
                          Text(timerController[1].toString())
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      '(${skill.getSkillType})',
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
                percent: .3,
                animation: true,
                animationDuration: 1200,
                progressColor: Colors.green[400],
                barRadius: const Radius.circular(12),
                leading: Text(
                  skill.getSkillLevelingObj.getExp.toString(),
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                trailing: Text(
                  skill.getSkillLevelingObj.getLevelUpExp.toString(),
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
