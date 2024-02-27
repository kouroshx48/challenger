import 'dart:async';

import 'package:challenger/components/clippers.dart';
import 'package:challenger/components/skill_tile.dart';
import 'package:challenger/controllers/skill.dart';
import 'package:challenger/data/user_data_base.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../components/skill_create_dialog.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({super.key});

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  double percentage = .2;

  //TODO shall be removed and consumer shall be used
  List<Skill> listSkills = [Skill(name: 'test', skillType: 'Active')];


  //check if a new skill is created or not
  //TODO shall be saved in Isar in timer part
  bool isSkillCreated = false;

  //load data from isar
  void _loadData() async {
    context.read<ChallengerDB>().readData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengerDB>(
        builder: (context, value, child) => Stack(
              children: [
                ListView.builder(
                    padding: const EdgeInsets.only(top: 175),
                    itemCount: value.skills!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onDoubleTap: () => removeSkill(index),
                        child: SkillTile(
                          skill: value.skills![index],
                        ),
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
                          center: isSkillCreated
                              ? onSkillWaitTimeWidget()
                              : addSkillWidget(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
  }

  Widget addSkillWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                showDialog(context: context, builder: (context) => const SkillCreationBox());
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

  Widget onSkillWaitTimeWidget() {
    return InkWell(
        onTap: () => setState(() {
              isSkillCreated = false;
            }),
        child: Text('remaining time'));
  }

  void removeSkill(int index){
    final skills = context.read<ChallengerDB>().skills;
    skills!.removeAt(index);
    context.read<ChallengerDB>().updateDate();
  }
}
