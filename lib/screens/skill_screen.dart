import 'dart:async';

import 'package:challenger/components/clippers.dart';
import 'package:challenger/components/skill_tile.dart';
import 'package:challenger/controllers/skill.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({super.key});

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  double percentage = .2;
  List<Skill> listSkills = [Skill(name: 'test', skillType: 'Active')];

  //a list for timer of skill point increase
  //[isTimerWorking, timeSpent(sec), timeToReach(sec)]
  List _timer = [false, 0, 60];

  //check if a new skill is created or not
  //TODO shall be saved in Hive
  bool isSkillCreated = false;

  //the timer thar increases the skill point
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
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 175),
            itemCount: listSkills.length,
            itemBuilder: (context, index) {
              return SkillTile(
                skill: listSkills[index],
                onSkillPointTimer: onSkillPointAdding,
                timerController: _timer,
              );
            }),
        ClipPath(
          clipper: SkillClipper(),
          child: Container(
            height: 232,
            color: Colors.grey[500],
            child: Padding(
              padding: const EdgeInsets.only(bottom: 72.0),
              child: Center(
                child: CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 15,
                  percent: percentage,
                  animation: true,
                  animationDuration: 1500,
                  backgroundColor: Colors.black12,
                  progressColor: percentage < .5
                      ? Colors.red.shade400
                      : (percentage < .75
                          ? Colors.orange.shade400
                          : Colors.green.shade400),
                  curve: Curves.linearToEaseOut,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: isSkillCreated ? null : addSkillWidget(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget addSkillWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                // setState(() {
                //   isSkillCreated = true;
                // });
              },
              child: const Icon(
                Icons.add,
                size: 40,
              )),
          const Text(
            'Add New Skill',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
  Widget onSkillWaitTimeWidget(){
    return Text('chck');
  }
}
