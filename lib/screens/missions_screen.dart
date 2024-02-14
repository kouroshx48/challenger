import 'package:challenger/controllers/mission.dart';
import 'package:challenger/controllers/user.dart';
import 'package:flutter/material.dart';
import 'package:challenger/components/clippers.dart';
import 'package:challenger/components/mission_tile.dart';
import 'package:challenger/components/dialog_box.dart';

class Challenges extends StatefulWidget {
  const Challenges({super.key});

  @override
  State<Challenges> createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  List listOfMissions = testUser.getUserMissions;
  final _nameController = TextEditingController();
  final _expController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 75),
            itemCount: listOfMissions.length,
            itemBuilder: (context, index) {
              return MissionTile(
                mission: listOfMissions[index],
                deleteFunction: (context) => onMissionDelete(index),
                completeFunction: (context)=> onMissionComplete(index),
              );
            }),
        ClipPath(
          clipper: MissionClipper(),
          child: Container(
            width: double.infinity,
            height: 75,
            color: Colors.grey[500],
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: createNewMission,
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void createNewMission() {
    showDialog(
        context: context,
        builder: (context) {
          return DiaLogBox(
            nameController: _nameController,
            expController: _expController,
            onSave: saveNewMission,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void saveNewMission() {
    int expAmount = int.parse(_expController.text);
    if(expAmount <= 75){
      setState(() {
        listOfMissions
            .add(Mission(name: _nameController.text, expAmount: expAmount));
        _nameController.clear();
        _expController.clear();
      });
      Navigator.of(context).pop();
    }else{
      _expController.text = 'please enter a valid number';
    }
  }
  void onMissionDelete(int index){
    setState(() {
      listOfMissions.removeAt(index);
    });
  }

  void onMissionComplete(int index) {
    Mission mission = listOfMissions[index];
    testUser.addExpToUser(mission.expAmount);
    onMissionDelete(index);
  }
}
