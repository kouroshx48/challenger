import 'package:challenger/controllers/mission.dart';
import 'package:challenger/data/user_data_base.dart';
import 'package:flutter/material.dart';
import 'package:challenger/components/clippers.dart';
import 'package:challenger/components/mission_tile.dart';
import 'package:challenger/components/dialog_box.dart';
import 'package:provider/provider.dart';

class MissionsScreen extends StatefulWidget {
  const MissionsScreen({super.key});

  @override
  State<MissionsScreen> createState() => _MissionsScreenState();
}

class _MissionsScreenState extends State<MissionsScreen> {
  final _nameController = TextEditingController();
  final _expController = TextEditingController();

  void _loadData() {
    context.read<ChallengerDB>().readData();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengerDB>(
      builder: (context, value, child) => Stack(
        children: [
          ListView.builder(
              padding: const EdgeInsets.only(top: 75),
              itemCount: value.missions!.length,
              itemBuilder: (context, index) {
                return MissionTile(
                  mission: value.missions![index],
                  deleteFunction: (context) => onMissionDelete(index),
                  completeFunction: (context) => onMissionComplete(index),
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
      ),
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
    List? missionDb = context.read<ChallengerDB>().missions;
    int expAmount = int.parse(_expController.text);
    if (expAmount <= 75) {
      setState(() {
        missionDb!.add(Mission(name: _nameController.text, expAmount: expAmount));
        context.read<ChallengerDB>().updateDate();
        _nameController.clear();
        _expController.clear();
      });
      Navigator.of(context).pop();
    } else {
      _expController.text = 'please enter a valid number';
    }
    print('$missionDb user mis dude');
  }

  void onMissionDelete(int index) {
    List? missionDb = context.read<ChallengerDB>().missions;
    setState(() {
      //remove mission
      missionDb?.removeAt(index);
      context.read<ChallengerDB>().updateDate();
    });
  }

  void onMissionComplete(int index) {
    List? missionDb = context.read<ChallengerDB>().missions;
    final challenger = context.read<ChallengerDB>().currentUser;
    Mission mission = missionDb![index];
    //add exp to user
    int? exp = mission.expAmount;
    challenger?.addExpToUser(exp!);
    context.read<ChallengerDB>().updateDate();

    onMissionDelete(index);
  }
}
