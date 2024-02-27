import 'dart:async';

import 'package:challenger/controllers/skill.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SkillTile extends StatefulWidget {
  final Skill skill;

  const SkillTile(
      {super.key,
      required this.skill,
      });

  @override
  State<SkillTile> createState() => _SkillTileState();
}

class _SkillTileState extends State<SkillTile> {
  final List _timer = [false, 0, 60];

  //[isTimerActive,timeSpent, timerEnd  ]
  void onSkillPointAdding() {
    var startTime = DateTime.now();
    int elapsedTime = _timer[1];
    setState(() {
      _timer[0] = !_timer[0];
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        //check if user has stopped the the timer
        if (_timer[0] == false) {
          timer.cancel();
        }
        if (_timer[1] == _timer[2]) {
          timer.cancel();
          _timer[0] = false;
          _timer[1] = 0;
          //TODO add Skill Point To Related Skill
        }
        if (_timer[0]) {
          var currentTime = DateTime.now();
          _timer[1] = elapsedTime +
              currentTime.second -
              startTime.second +
              60 * (currentTime.minute - startTime.minute) +
              60 * 60 * (currentTime.hour - startTime.hour);
        }
      });
    });
  }

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
                            onTap: onSkillPointAdding,
                            borderRadius: BorderRadius.circular(50),
                            child: !_timer[0]
                                ? const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white70,
                                  )
                                : const Icon(Icons.pause,
                                    color: Colors.white70)),
                        percent: _timer[1] / _timer[2],
                        backgroundColor: Colors.grey.shade500,
                        progressColor:
                        _timer[1] / _timer[2] < .5
                                ? Colors.red.shade400
                                : (_timer[1] / _timer[2] < .75
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
                                widget.skill.name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                '(lvl ${widget.skill.skillLeveling.level})',
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: 14),
                              )
                            ],
                          ),
                          Text(_timer[1].toString())
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      '(${widget.skill.skillType})',
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
                  widget.skill.skillLeveling.exp.toString(),
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                trailing: Text(
                  widget.skill.skillLeveling.levelUpExp.toString(),
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
